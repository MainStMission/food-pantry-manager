/* http://keith-wood.name/datetimeEntry.html
   Date and time entry for jQuery v1.1.1.
   Written by Keith Wood (kbwood{at}iinet.com.au) September 2010.
   Licensed under the MIT (https://github.com/jquery/jquery/blob/master/MIT-LICENSE.txt) license.
   Please attribute the author if you use it. */

/* Turn an input field into an entry point for a date and/or time value.
   The date/time can be entered via directly typing the value,
   via the arrow keys, or via spinner buttons.
   It is configurable to reorder the fields, to enforce a minimum
   and/or maximum date/time, and to change the spinner image.
   Attach it with $('input selector').datetimeEntry(); for default settings,
   or configure it with options like:
   $('input selector').datetimeEntry(
      {spinnerImage: 'spinnerSquare.png', spinnerSize: [20, 20, 0]}); */

(function($) { // Hide scope, no $ conflict

/* DatetimeEntry manager.
   Use the singleton instance of this class, $.datetimeEntry, to interact with the date
   entry functionality. Settings for fields are maintained in an instance object,
   allowing multiple different settings on the same page. */
function DatetimeEntry() {
	this._disabledInputs = []; // List of datetime inputs that have been disabled
	this.regional = []; // Available regional settings, indexed by language code
	this.regional[''] = { // Default regional settings
		datetimeFormat: 'O/D/Y H:Ma', // The format of the date text:
			// 'y' for short year, 'Y' for full year, 'o' for month, 'O' for two-digit month,
			// 'n' for abbreviated month name, 'N' for full month name,
			// 'd' for day, 'D' for two-digit day, 'w' for abbreviated day name and number,
			// 'W' for full day name and number), 'h' for hour, 'H' for two-digit hour,
			// 'm' for minute, 'M' for two-digit minutes, 's' for seconds,
			// 'S' for two-digit seconds, 'a' for AM/PM indicator (omit for 24-hour)
		datetimeSeparators: '.', // Additional separators between datetime portions
		monthNames: ['January', 'February', 'March', 'April', 'May', 'June',
			'July', 'August', 'September', 'October', 'November', 'December'], // Names of the months
		monthNamesShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
			'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'], // Abbreviated names of the months
		// Names of the days
		dayNames: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
		dayNamesShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'], // Abbreviated names of the days
		ampmNames: ['AM', 'PM'], // Names of morning/evening markers
		// The popup texts for the spinner image areas
		spinnerTexts: ['Today', 'Previous field', 'Next field', 'Increment', 'Decrement'],
		isRTL: false // Does this language run right-to-left?
	};
	this._defaults = {
		appendText: '', // Display text following the input box, e.g. showing the format
		initialField: 0, // The field to highlight initially, 0 = hours, 1 = minutes, ...
		useMouseWheel: true, // True to use mouse wheel for increment/decrement if possible,
			// false to never use it
		shortYearCutoff: '+10', // The century cutoff for two-digit years,
			// absolute (numeric) or relative (string)
		defaultDatetime: null, // The date to use if none has been set, leave at null for now
		minDatetime: null, // The earliest selectable datetime, or null for no limit
		maxDatetime: null, // The latest selectable datetime, or null for no limit
		minTime: null, // The earliest selectable time regardless of date, or null for no limit
		maxTime: null, // The latest selectable time regardless of date, or null for no limit
		timeSteps: [1, 1, 1], // Steps for each of hours/minutes/seconds when incrementing/decrementing
		spinnerImage: 'spinnerDefault.png', // The URL of the images to use for the date spinner
			// Seven images packed horizontally for normal, each button pressed, and disabled
		spinnerSize: [20, 20, 8], // The width and height of the spinner image,
			// and size of centre button for current date
		spinnerBigImage: '', // The URL of the images to use for the expanded date spinner
			// Seven images packed horizontally for normal, each button pressed, and disabled
		spinnerBigSize: [40, 40, 16], // The width and height of the expanded spinner image,
			// and size of centre button for current date
		spinnerIncDecOnly: false, // True for increment/decrement buttons only, false for all
		spinnerRepeat: [500, 250], // Initial and subsequent waits in milliseconds
			// for repeats on the spinner buttons
		beforeShow: null, // Function that takes an input field and
			// returns a set of custom settings for the date entry
		altField: null, // Selector, element or jQuery object for an alternate field to keep synchronised
		altFormat: null // A separate format for the alternate field
	};
	$.extend(this._defaults, this.regional['']);
}

$.extend(DatetimeEntry.prototype, {
	/* Class name added to elements to indicate already configured with datetime entry. */
	markerClassName: 'hasDatetimeEntry',
	/* Name of the data property for instance settings. */
	propertyName: 'datetimeEntry',

	/* Class name for the appended content. */
	_appendClass: 'datetimeEntry_append',
	/* Class name for the date/time entry control. */
	_controlClass: 'datetimeEntry_control',
	/* Class name for the expanded spinner. */
	_expandClass: 'datetimeEntry_expand',

	/* Override the default settings for all instances of the datetime entry.
	   @param  options  (object) the new settings to use as defaults (anonymous object)
	   @return  (DatetimeEntry) this object */
	setDefaults: function(options) {
		$.extend(this._defaults, options || {});
		return this;
	},

	/* Attach the datetime entry handler to an input field.
	   @param  target   (element) the field to attach to
	   @param  options  (object) custom settings for this instance */
	_attachPlugin: function(target, options) {
		var input = $(target);
		if (input.hasClass(this.markerClassName)) {
			return;
		}
		var inst = {options: $.extend({}, this._defaults, options), input: input,
			_field: 0, _selectedYear: 0, _selectedMonth: 0, _selectedDay: 0,
			_selectedHour: 0, _selectedMinute: 0, _selectedSecond: 0};
		this._decodeDatetimeFormat(inst);
		input.data(this.propertyName, inst).addClass(this.markerClassName).
			bind('focus.' + this.propertyName, this._doFocus).
			bind('blur.' + this.propertyName, this._doBlur).
			bind('click.' + this.propertyName, this._doClick).
			bind('keydown.' + this.propertyName, this._doKeyDown).
			bind('keypress.' + this.propertyName, this._doKeyPress).
			bind('paste.' + this.propertyName, function(event) { // Check pastes
				setTimeout(function() { plugin._extractDatetime(inst); }, 1);
			});
		this._optionPlugin(target, options);
	},

	/* Retrieve or reconfigure the settings for a datetime entry control.
	   @param  target   (element) the control to affect
	   @param  options  (object) the new options for this instance or
	                    (string) an individual property name
	   @param  value    (any) the individual property value (omit if options
	                    is an object or to retrieve the value of a setting)
	   @return  (any) if retrieving a value */
	_optionPlugin: function(target, options, value) {
		target = $(target);
		var inst = target.data(this.propertyName);
		if (!options || (typeof options == 'string' && value == null)) { // Get option
			var name = options;
			options = (inst || {}).options;
			return (options && name ? options[name] : options);
		}

		if (!target.hasClass(this.markerClassName)) {
			return;
		}
		options = options || {};
		if (typeof options == 'string') {
			var name = options;
			options = {};
			options[name] = value;
		}
		var currentDate = this._parseDatetime(inst, target.val());
		$.extend(inst.options, options);
		inst._field = 0;
		this._decodeDatetimeFormat(inst);
		if (currentDate) {
			this._setDatetime(inst, currentDate);
		}
		// Remove stuff dependent on old settings
		target.next('span.' + this._appendClass).remove();
		target.parent().find('span.' + this._controlClass).remove();
		if ($.fn.mousewheel) {
			target.unmousewheel();
		}
		// And re-add if requested
		var spinner = (!inst.options.spinnerImage ? null : 
			$('<span class="' + this._controlClass + '" style="display: inline-block; ' +
			'background: url(\'' + inst.options.spinnerImage + '\') 0 0 no-repeat; width: ' +
			inst.options.spinnerSize[0] + 'px; height: ' + inst.options.spinnerSize[1] + 'px;"></span>'));
		target.after(inst.options.appendText ? '<span class="' + this._appendClass + '">' +
			inst.options.appendText + '</span>' : '').after(spinner || '');
		// Allow mouse wheel usage
		if (inst.options.useMouseWheel && $.fn.mousewheel) {
			target.mousewheel(this._doMouseWheel);
		}
		if (spinner) {
			spinner.mousedown(this._handleSpinner).mouseup(this._endSpinner).
				mouseover(this._expandSpinner).mouseout(this._endSpinner).
				mousemove(this._describeSpinner);
		}
	},

	/* Enable a datetime entry input and any associated spinner.
	   @param  target  (element) single input field */
	_enablePlugin: function(target) {
		this._enableDisable(target, false);
	},

	/* Disable a datetime entry input and any associated spinner.
	   @param  target  (element) single input field */
	_disablePlugin: function(target) {
		this._enableDisable(target, true);
	},

	/* Enable or disable a datetime entry input and any associated spinner.
	   @param  target   (element) single input field
	   @param  disable  (boolean) true to disable, false to enable */
	_enableDisable: function(target, disable) {
		var inst = $.data(target, this.propertyName);
		if (!inst) {
			return;
		}
		target.disabled = disable;
		if (target.nextSibling && target.nextSibling.nodeName.toLowerCase() == 'span') {
			plugin._changeSpinner(inst, target.nextSibling, (disable ? 5 : -1));
		}
		plugin._disabledInputs = $.map(plugin._disabledInputs,
			function(value) { return (value == target ? null : value); }); // Delete entry
		if (disable) {
			plugin._disabledInputs.push(target);
		}
	},

	/* Check whether an input field has been disabled.
	   @param  target  (element) input field to check
	   @return  (boolean) true if this field has been disabled, false if it is enabled */
	_isDisabledPlugin: function(target) {
		return $.inArray(target, this._disabledInputs) > -1;
	},

	/* Locate fields within the datetime format.
	   @param  inst  (object) the instance settings */
	_decodeDatetimeFormat: function(inst) {
		inst._fields = [];
		inst._ampmField = -1;
		for (var i = 0; i < inst.options.datetimeFormat.length; i++) {
			if (inst.options.datetimeFormat.charAt(i).match(/[yYoOnNdDwWhHmMsSa]/)) {
				inst._fields.push(i);
			}
			if (inst.options.datetimeFormat.charAt(i) == 'a') {
				inst._ampmField = inst._fields.length - 1;
			}
		}
	},

	/* Remove the datetime entry functionality from an input.
	   @param  target  (element) input field to affect */
	_destroyPlugin: function(target) {
		target = $(target);
		if (!target.hasClass(this.markerClassName)) {
			return;
		}
		target.removeClass(this.markerClassName).removeData(this.propertyName).
			unbind('.' + this.propertyName);
		if ($.fn.mousewheel) {
			target.unmousewheel();
		}
		this._disabledInputs = $.map(this._disabledInputs,
			function(value) { return (value == target[0] ? null : value); }); // Delete entry
		target.siblings('.' + this._appendClass + ',.' + this._controlClass).remove();
	},

	/* Initialise the current datetime for a datetime entry input field.
	   @param  target    (element) input field to update
	   @param  datetime  (Date) the new datetime or null for now */
	_setDatetimePlugin: function(target, datetime) {
		var inst = $.data(target, this.propertyName);
		if (inst) {
			if (datetime === null || datetime === '') {
				inst.input.val('');
			}
			else {
				this._setDatetime(inst, datetime ? (typeof datetime == 'object' ?
					new Date(datetime.getTime()) : datetime) : null);
			}
		}
	},

	/* Retrieve the current datetime for a datetime entry input field.
	   @param  target  (element) input field to update
	   @return  (Date) current datetime or null if none */
	_getDatetimePlugin: function(target) {
		var inst = $.data(target, this.propertyName);
		return (inst ? this._parseDatetime(inst, inst.input.val()) : null);
	},

	/* Retrieve the millisecond offset for the current time.
	   @param  target  (element) input field to examine
	   @return  (number) the time as milliseconds offset or zero if none */
	_getOffsetPlugin: function(target) {
		var inst = $.data(target, this.propertyName);
		var time = (inst ? plugin._parseDatetime(inst, inst.input.val()) : null);
		return (!time ? 0 :
			(time.getHours() * 3600 + time.getMinutes() * 60 + time.getSeconds()) * 1000);
	},

	/* Initialise datetime entry.
	   @param  target  (element) the input field or
	                   (event) the focus event */
	_doFocus: function(target) {
		var input = (target.nodeName && target.nodeName.toLowerCase() == 'input' ? target : this);
		if (plugin._lastInput == input || plugin._isDisabledPlugin(input)) {
			plugin._focussed = false;
			return;
		}
		var inst = $.data(input, plugin.propertyName);
		plugin._focussed = true;
		plugin._lastInput = input;
		plugin._blurredInput = null;
		$.extend(inst.options, ($.isFunction(inst.options.beforeShow) ?
			inst.options.beforeShow.apply(input, [input]) : {}));
		plugin._extractDatetime(inst);
		setTimeout(function() { plugin._showField(inst); }, 10);
	},

	/* Note that the field has been exited.
	   @param  event  (event) the blur event */
	_doBlur: function(event) {
		plugin._blurredInput = plugin._lastInput;
		plugin._lastInput = null;
	},

	/* Select appropriate field portion on click, if already in the field.
	   @param  event  (event) the click event */
	_doClick: function(event) {
		var input = event.target;
		var inst = $.data(input, plugin.propertyName);
		if (!plugin._focussed) {
			var datetimeFormat = inst.options.datetimeFormat;
			inst._field = 0;
			if (input.selectionStart != null) { // Use input select range
				var end = 0;
				for (var field = 0; field < datetimeFormat.length; field++) {
					end += plugin._fieldLength(inst, datetimeFormat.charAt(field));
					if (input.selectionStart < end) {
						break;
					}
					inst._field += (datetimeFormat.charAt(field).match(/[yondwhmsa]/i) ? 1 : 0);
				}
			}
			else if (input.createTextRange) { // Check against bounding boxes
				var src = $(event.srcElement);
				var range = input.createTextRange();
				var convert = function(value) {
					return {thin: 2, medium: 4, thick: 6}[value] || value;
				};
				var offsetX = event.clientX + document.documentElement.scrollLeft -
					(src.offset().left + parseInt(convert(src.css('border-left-width')), 10)) -
					range.offsetLeft; // Position - left edge - alignment
				var end = 0;
				for (var field = 0; field < datetimeFormat.length; field++) {
					end += plugin._fieldLength(inst, datetimeFormat.charAt(field));
					range.collapse();
					range.moveEnd('character', end);
					if (offsetX < range.boundingWidth) { // And compare
						break;
					}
					inst._field += (datetimeFormat.charAt(field).match(/[yondwhmsa]/i) ? 1 : 0);
				}
			}
		}
		plugin._showField(inst);
		plugin._focussed = false;
	},

	/* Handle keystrokes in the field.
	   @param  event  (event) the keydown event
	   @return  (boolean) true to continue, false to stop processing */
	_doKeyDown: function(event) {
		if (event.keyCode >= 48) { // >= '0'
			return true;
		}
		var inst = $.data(event.target, plugin.propertyName);
		switch (event.keyCode) {
			case 9: return (event.shiftKey ?
						// Move to previous datetime field, or out if at the beginning
						plugin._changeField(inst, -1, true) :
						// Move to next datetime field, or out if at the end
						plugin._changeField(inst, +1, true));
			case 35: if (event.ctrlKey) { // Clear datetime on ctrl+end
						plugin._setValue(inst, '');
					}
					else { // Last field on end
						inst._field = inst._fields.length - 1;
						plugin._adjustField(inst, 0);
					}
					break;
			case 36: if (event.ctrlKey) { // Current datetime on ctrl+home
						plugin._setDatetime(inst);
					}
					else { // First field on home
						inst._field = 0;
						plugin._adjustField(inst, 0);
					}
					break;
			case 37: plugin._changeField(inst, -1, false); break; // Previous field on left
			case 38: plugin._adjustField(inst, +1); break; // Increment date field on up
			case 39: plugin._changeField(inst, +1, false); break; // Next field on right
			case 40: plugin._adjustField(inst, -1); break; // Decrement datetime field on down
			case 46: plugin._setValue(inst, ''); break; // Clear datetime on delete
			default: return true;
		}
		return false;
	},

	/* Disallow unwanted characters.
	   @param  event  (event) the keypress event
	   @return  (boolean) true to continue, false to stop processing */
	_doKeyPress: function(event) {
		var chr = String.fromCharCode(event.charCode == undefined ? event.keyCode : event.charCode);
		if (chr < ' ') {
			return true;
		}
		var inst = $.data(event.target, plugin.propertyName);
		plugin._handleKeyPress(inst, chr);
		return false;
	},

	/* Increment/decrement on mouse wheel activity.
	   @param  event  (event) the mouse wheel event
	   @param  delta  (number) the amount of change */
	_doMouseWheel: function(event, delta) {
		if (plugin._isDisabledPlugin(event.target)) {
			return;
		}
		var inst = $.data(event.target, plugin.propertyName);
		inst.input.focus();
		if (!inst.input.val()) {
			plugin._extractDatetime(inst);
		}
		plugin._adjustField(inst, delta);
		event.preventDefault();
	},

	/* Expand the spinner, if possible, to make it easier to use.
	   @param  event  (event) the mouse over event */
	_expandSpinner: function(event) {
		var spinner = plugin._getSpinnerTarget(event);
		var inst = $.data(plugin._getInput(spinner), plugin.propertyName);
		if (plugin._isDisabledPlugin(inst.input[0])) {
			return;
		}
		if (inst.options.spinnerBigImage) {
			inst._expanded = true;
			var offset = $(spinner).offset();
			var relative = null;
			$(spinner).parents().each(function() {
				var parent = $(this);
				if (parent.css('position') == 'relative' ||
						parent.css('position') == 'absolute') {
					relative = parent.offset();
				}
				return !relative;
			});
			$('<div class="' + plugin._expandClass + '" style="position: absolute; left: ' +
				(offset.left - (inst.options.spinnerBigSize[0] - inst.options.spinnerSize[0]) / 2 -
				(relative ? relative.left : 0)) + 'px; top: ' +
				(offset.top - (inst.options.spinnerBigSize[1] - inst.options.spinnerSize[1]) / 2 -
				(relative ? relative.top : 0)) + 'px; width: ' +
				inst.options.spinnerBigSize[0] + 'px; height: ' +
				inst.options.spinnerBigSize[1] + 'px; background: transparent url(' +
				inst.options.spinnerBigImage + ') no-repeat 0px 0px; z-index: 10;"></div>').
				mousedown(plugin._handleSpinner).mouseup(plugin._endSpinner).
				mouseout(plugin._endExpand).mousemove(plugin._describeSpinner).
				insertAfter(spinner);
		}
	},

	/* Locate the actual input field from the spinner.
	   @param  spinner  (element) the current spinner
	   @return  (element) the corresponding input */
	_getInput: function(spinner) {
		return $(spinner).siblings('.' + plugin.markerClassName)[0];
	},

	/* Change the title based on position within the spinner.
	   @param  event  (event) the mouse move event */
	_describeSpinner: function(event) {
		var spinner = plugin._getSpinnerTarget(event);
		var inst = $.data(plugin._getInput(spinner), plugin.propertyName);
		spinner.title = inst.options.spinnerTexts[plugin._getSpinnerRegion(inst, event)];
	},

	/* Handle a click on the spinner.
	   @param  event  (event) the mouse click event */
	_handleSpinner: function(event) {
		var spinner = plugin._getSpinnerTarget(event);
		var input = plugin._getInput(spinner);
		if (plugin._isDisabledPlugin(input)) {
			return;
		}
		if (input == plugin._blurredInput) {
			plugin._lastInput = input;
			plugin._blurredInput = null;
		}
		var inst = $.data(input, plugin.propertyName);
		plugin._doFocus(input);
		var region = plugin._getSpinnerRegion(inst, event);
		plugin._changeSpinner(inst, spinner, region);
		plugin._actionSpinner(inst, region);
		plugin._timer = null;
		plugin._handlingSpinner = true;
		if (region >= 3 && inst.options.spinnerRepeat[0]) { // Repeat increment/decrement
			plugin._timer = setTimeout(
				function() { plugin._repeatSpinner(inst, region); },
				inst.options.spinnerRepeat[0]);
			$(spinner).one('mouseout', plugin._releaseSpinner).
				one('mouseup', plugin._releaseSpinner);
		}
	},

	/* Action a click on the spinner.
	   @param  inst    (object) the instance settings
	   @param  region  (number) the spinner "button" */
	_actionSpinner: function(inst, region) {
		if (!inst.input.val()) {
			plugin._extractDatetime(inst);
		}
		switch (region) {
			case 0: this._setDatetime(inst); break;
			case 1: this._changeField(inst, -1, false); break;
			case 2: this._changeField(inst, +1, false); break;
			case 3: this._adjustField(inst, +1); break;
			case 4: this._adjustField(inst, -1); break;
		}
	},

	/* Repeat a click on the spinner.
	   @param  inst    (object) the instance settings
	   @param  region  (number) the spinner "button" */
	_repeatSpinner: function(inst, region) {
		if (!plugin._timer) {
			return;
		}
		plugin._lastInput = plugin._blurredInput;
		this._actionSpinner(inst, region);
		this._timer = setTimeout(
			function() { plugin._repeatSpinner(inst, region); },
			inst.options.spinnerRepeat[1]);
	},

	/* Stop a spinner repeat.
	   @param  event  (event) the mouse event */
	_releaseSpinner: function(event) {
		clearTimeout(plugin._timer);
		plugin._timer = null;
	},

	/* Tidy up after an expanded spinner.
	   @param  event  (event) the mouse event */
	_endExpand: function(event) {
		plugin._timer = null;
		var spinner = plugin._getSpinnerTarget(event);
		var input = plugin._getInput(spinner);
		var inst = $.data(input, plugin.propertyName);
		$(spinner).remove();
		inst._expanded = false;
	},

	/* Tidy up after a spinner click.
	   @param  event  (event) the mouse event */
	_endSpinner: function(event) {
		plugin._timer = null;
		var spinner = plugin._getSpinnerTarget(event);
		var input = plugin._getInput(spinner);
		var inst = $.data(input, plugin.propertyName);
		if (!plugin._isDisabledPlugin(input)) {
			plugin._changeSpinner(inst, spinner, -1);
		}
		if (plugin._handlingSpinner) {
			plugin._lastInput = plugin._blurredInput;
		}
		if (plugin._lastInput && plugin._handlingSpinner) {
			plugin._showField(inst);
		}
		plugin._handlingSpinner = false;
	},

	/* Retrieve the spinner from the event.
	   @param  event  (event) the mouse click event
	   @return  (element) the target field */
	_getSpinnerTarget: function(event) {
		return event.target || event.srcElement;
	},

	/* Determine which "button" within the spinner was clicked.
	   @param  inst   (object) the instance settings
	   @param  event  (event) the mouse event
	   @return  (number) the spinner "button" number */
	_getSpinnerRegion: function(inst, event) {
		var spinner = this._getSpinnerTarget(event);
		var pos = $(spinner).offset();
		var scrolled = [document.documentElement.scrollLeft || document.body.scrollLeft,
			document.documentElement.scrollTop || document.body.scrollTop];
		var left = (inst.options.spinnerIncDecOnly ? 99 : event.clientX + scrolled[0] - pos.left);
		var top = event.clientY + scrolled[1] - pos.top;
		var spinnerSize = inst.options[inst._expanded ? 'spinnerBigSize' : 'spinnerSize'];
		var right = (inst.options.spinnerIncDecOnly ? 99 : spinnerSize[0] - 1 - left);
		var bottom = spinnerSize[1] - 1 - top;
		if (spinnerSize[2] > 0 && Math.abs(left - right) <= spinnerSize[2] &&
				Math.abs(top - bottom) <= spinnerSize[2]) {
			return 0; // Centre button
		}
		var min = Math.min(left, top, right, bottom);
		return (min == left ? 1 : (min == right ? 2 : (min == top ? 3 : 4))); // Nearest edge
	},

	/* Change the spinner image depending on button clicked.
	   @param  inst     (object) the instance settings
	   @param  spinner  (element) the spinner control
	   @param  region   (number) the spinner "button" */
	_changeSpinner: function(inst, spinner, region) {
		$(spinner).css('background-position', '-' + ((region + 1) *
			inst.options[inst._expanded ? 'spinnerBigSize' : 'spinnerSize'][0]) + 'px 0px');
	},

	/* Extract the datetime value from the input field, or default to now.
	   @param  inst  (object) the instance settings */
	_extractDatetime: function(inst) {
		var currentDatetime = this._parseDatetime(inst, inst.input.val()) || this._normaliseDatetime(
			this._determineDatetime(inst, inst.options.defaultDatetime) || new Date());
		var fields = this._constrainTime(inst, [currentDatetime.getHours(),
			currentDatetime.getMinutes(), currentDatetime.getSeconds()]);
		inst._selectedYear = currentDatetime.getFullYear();
		inst._selectedMonth = currentDatetime.getMonth();
		inst._selectedDay = currentDatetime.getDate();
		inst._selectedHour = fields[0];
		inst._selectedMinute = fields[1];
		inst._selectedSecond = fields[2];
		inst._lastChr = '';
		inst._field = Math.max(0, inst.options.initialField);
		if (inst.input.val() != '') {
			this._showDatetime(inst);
		}
	},

	/* Parse the datetime value from the given text.
	   @param  inst   (object) the instance settings
	   @param  value  (string) the value to parse
	   @return  (Date) the retrieved datetime or null if no value */
	_parseDatetime: function(inst, value) {
		if (!value) {
			return null;
		}
		var year = 0;
		var month = 0;
		var day = 0;
		var hour = 0;
		var minute = 0;
		var second = 0;
		var index = 0;
		var datetimeFormat = inst.options.datetimeFormat;
		var skipNumber = function() {
			while (index < value.length && value.charAt(index).match(/^[0-9]/)) {
				index++;
			}
		};
		var i;
		for (i = 0; i < datetimeFormat.length && index < value.length; i++) {
			var field = datetimeFormat.charAt(i);
			var num = parseInt(value.substring(index), 10);
			if (field.match(/y|o|d|h|m|s/i) && isNaN(num)) {
				throw 'Invalid date';
			}
			num = (isNaN(num) ? 0 : num);
			switch (field) {
				case 'y': case 'Y':
					year = num;
					skipNumber();
					break;
				case 'o': case 'O':
					month = num;
					skipNumber();
					break;
				case 'n': case 'N': 
					var monthNames = inst.options[field == 'N' ? 'monthNames' : 'monthNamesShort'];
					for (var j = 0; j < monthNames.length; j++) {
						if (value.substring(index).substr(0, monthNames[j].length).toLowerCase() ==
								monthNames[j].toLowerCase()) {
							month = j + 1;
							index += monthNames[j].length;
							break;
						}
					}
					break;
				case 'w': case 'W':
					var dayNames = inst.options[field == 'W' ? 'dayNames' : 'dayNamesShort'];
					for (var j = 0; j < dayNames.length; j++) {
						if (value.substring(index).substr(0, dayNames[j].length).toLowerCase() ==
								dayNames[j].toLowerCase()) {
							index += dayNames[j].length + 1;
							break;
						}
					}
					num = parseInt(value.substring(index), 10);
					num = (isNaN(num) ? 0 : num);
					// Fall through
				case 'd': case 'D':
					day = num;
					skipNumber();
					break;
				case 'h': case 'H':
					hour = num;
					skipNumber();
					break;
				case 'm': case 'M':
					minute = num;
					skipNumber();
					break;
				case 's': case 'S':
					second = num;
					skipNumber();
					break;
				case 'a':
					var pm = (value.substr(index, inst.options.ampmNames[1].length).toLowerCase() ==
						inst.options.ampmNames[1].toLowerCase());
					hour = (hour == 12 ? 0 : hour) + (pm ? 12 : 0);
					index += inst.options.ampmNames[0].length;
					break;
				default:
					index++;
			}
		}
		if (i < datetimeFormat.length) {
			throw 'Invalid date';
		}
		year += (year >= 100 || datetimeFormat.indexOf('y') == -1 ? 0 :
			(year > this._shortYearCutoff(inst) ? 1900 : 2000));
		var fields = this._constrainTime(inst, [hour, minute, second]);
		var date = new Date(year, Math.max(0, month - 1), day, fields[0], fields[1], fields[2]);
		if (datetimeFormat.match(/y|o|n|d|w/i) && (date.getFullYear() != year ||
				date.getMonth() + 1 != month || date.getDate() != day)) {
			throw 'Invalid date';
		}
		return date;
	},

	/* Set the selected date/time into the input field.
	   @param  inst  (object) the instance settings */
	_showDatetime: function(inst) {
		this._setValue(inst, this._formatDatetime(inst, inst.options.datetimeFormat));
		this._showField(inst);
	},

	/* Format a date/time as requested.
	   @param  inst    (object) the instance settings
	   @param  format  (string) the date/time format to use
	   @return  (string) the formatted date/time */
	_formatDatetime: function(inst, format) {
		var currentDatetime = '';
		var ampm = format.indexOf('a') > -1;
		for (var i = 0; i < format.length; i++) {
			var field = format.charAt(i);
			switch (field) {
				case 'y':
					currentDatetime += this._formatNumber(inst._selectedYear % 100);
					break;
				case 'Y':
					currentDatetime += this._formatNumber(inst._selectedYear, 4);
					break;
				case 'o': case 'O':
					currentDatetime += this._formatNumber(inst._selectedMonth + 1, field == 'o' ? 1 : 2);
					break;
				case 'n': case 'N':
					currentDatetime += inst.options[field == 'N' ?
						'monthNames' : 'monthNamesShort'][inst._selectedMonth];
					break;
				case 'd': case 'D':
					currentDatetime += this._formatNumber(inst._selectedDay, field == 'd' ? 1 : 2);
					break;
				case 'w': case 'W':
					currentDatetime += inst.options[field == 'W' ? 'dayNames' : 'dayNamesShort']
						[new Date(inst._selectedYear, inst._selectedMonth, inst._selectedDay).getDay()] +
						' ' + this._formatNumber(inst._selectedDay);
					break;
				case 'h': case 'H':
					currentDatetime += this._formatNumber(!ampm ? inst._selectedHour :
						inst._selectedHour % 12 || 12, field == 'h' ? 1 : 2);
					break;
				case 'm': case 'M':
					currentDatetime += this._formatNumber(inst._selectedMinute, field == 'm' ? 1 : 2);
					break;
				case 's': case 'S':
					currentDatetime += this._formatNumber(inst._selectedSecond, field == 's' ? 1 : 2);
					break;
				case 'a':
					currentDatetime += inst.options.ampmNames[inst._selectedHour < 12 ? 0 : 1];
					break;
				default:
					currentDatetime += field;
					break;
			}
		}
		return currentDatetime;
	},

	/* Highlight the current datetime field.
	   @param  inst  (object) the instance settings */
	_showField: function(inst) {
		var input = inst.input[0];
		if (inst.input.is(':hidden') || plugin._lastInput != input) {
			return;
		}
		var start = 0;
		for (var i = 0; i < inst._fields[inst._field]; i++) {
			start += this._fieldLength(inst, inst.options.datetimeFormat.charAt(i));
		}
		var end = start + this._fieldLength(inst, inst.options.datetimeFormat.charAt(i));
		if (input.setSelectionRange) { // Mozilla
			input.setSelectionRange(start, end);
		}
		else if (input.createTextRange) { // IE
			var range = input.createTextRange();
			range.moveStart('character', start);
			range.moveEnd('character', end - inst.input.val().length);
			range.select();
		}
		if (!input.disabled) {
			input.focus();
		}
	},

	/* Calculate the field length.
	   @param  inst    (object) the instance settings
	   @param  format  (char) the format character
	   @return  (number) the length of this subfield */
	_fieldLength: function(inst, format) {
		switch (format) {
			case 'Y':
				return 4;
			case 'n': case 'N':
				return inst.options[format == 'N' ? 'monthNames' : 'monthNamesShort']
					[inst._selectedMonth].length;
			case 'w': case 'W':
				return inst.options[format == 'W' ? 'dayNames' : 'dayNamesShort']
					[new Date(inst._selectedYear, inst._selectedMonth, inst._selectedDay).
					getDay()].length + 3;
			case 'y': case 'O': case 'D': case 'H': case 'M': case 'S':
				return 2;
			case 'o':
				return ('' + (inst._selectedMonth + 1)).length;
			case 'd':
				return ('' + inst._selectedDay).length;
			case 'h':
				return ('' + (inst._ampmField == -1 ?
					inst._selectedHour : inst._selectedHour % 12 || 12)).length;
			case 'm':
				return ('' + inst._selectedMinute).length;
			case 's':
				return ('' + inst._selectedSecond).length;
			case 'a':
				return inst.options.ampmNames[0].length;
			default:
				return 1;
		}
	},

	/* Ensure displayed number is a certain length.
	   @param  value   (number) current value
	   @param  length  (number) the minimum length (optional, default 2)
	   @return  (string) number with at least length digits */
	_formatNumber: function(value, length) {
		value = '' + value;
		length = length || 2;
		while (value.length < length) {
			value = '0' + value;
		}
		return value;
	},

	/* Update the input field and notify listeners.
	   @param  inst   (object) the instance settings
	   @param  value  (string) the new value */
	_setValue: function(inst, value) {
		if (value != inst.input.val()) {
			if (inst.options.altField) {
				$(inst.options.altField).val(!value ? '' : this._formatDatetime(inst,
					inst.options.altFormat || inst.options.datetimeFormat));
			}
			inst.input.val(value).trigger('change');
		}
	},

	/* Move to previous/next field, or out of field altogether if appropriate.
	   @param  inst     (object) the instance settings
	   @param  offset   (number) the direction of change (-1, +1)
	   @param  moveOut  (boolean) true if can move out of the field
	   @return  (boolean) true if exitting the field, false if not */
	_changeField: function(inst, offset, moveOut) {
		var atFirstLast = (inst.input.val() == '' ||
			inst._field == (offset == -1 ? 0 : inst._fields.length - 1));
		if (!atFirstLast) {
			inst._field += offset;
		}
		this._showField(inst);
		inst._lastChr = '';
		return (atFirstLast && moveOut);
	},

	/* Update the current field in the direction indicated.
	   @param  inst    (object) the instance settings
	   @param  offset  (number) the amount to change by */
	_adjustField: function(inst, offset) {
		if (inst.input.val() == '') {
			offset = 0;
		}
		var field = inst.options.datetimeFormat.charAt(inst._fields[inst._field]);
		var year = inst._selectedYear + (field.match(/y/i) ? offset : 0);
		var month = inst._selectedMonth + (field.match(/o|n/i) ? offset : 0);
		var day = (field.match(/d|w/i) ? inst._selectedDay + offset :
			Math.min(inst._selectedDay, this._getDaysInMonth(year, month)));
		var timeSteps = inst.options.timeSteps;
		var hour = inst._selectedHour + (field.match(/h/i) ? offset * timeSteps[0] : 0) +
			(field == 'a' && offset != 0 ? (inst._selectedHour < 12 ? +12 : -12) : 0);
		var minute = inst._selectedMinute + (field.match(/m/i) ? offset * timeSteps[1] : 0);
		var second = inst._selectedSecond + (field.match(/s/i) ? offset * timeSteps[2] : 0);
		this._setDatetime(inst, new Date(year, month, day, hour, minute, second));
	},

	/* Find the number of days in a given month.
	   @param  year   (number) the full year
	   @param  month  (number) the month (0 to 11)
	   @return  (number) the number of days in this month */
	_getDaysInMonth: function(year, month) {
		return new Date(year, month + 1, 0, 12).getDate();
	},

	/* Check against minimum/maximum and display datetime.
	   @param  inst      (object) the instance settings
	   @param  datetime  (Date) an actual date or
	                     (number) offset in days from now or
					     (string) units and periods of offsets from now */
	_setDatetime: function(inst, datetime) {
		// Normalise to base time
		datetime = this._normaliseDatetime(this._determineDatetime(inst,
			datetime || inst.options.defaultDatetime) || new Date());
		var fields = this._constrainTime(inst,
			[datetime.getHours(), datetime.getMinutes(), datetime.getSeconds()]);
		datetime.setHours(fields[0], fields[1], fields[2]);
		var minDatetime = this._normaliseDatetime(
			this._determineDatetime(inst, inst.options.minDatetime));
		var maxDatetime = this._normaliseDatetime(
			this._determineDatetime(inst, inst.options.maxDatetime));
		var minTime = this._normaliseDatetime(
			this._determineDatetime(inst, inst.options.minTime), 'd');
		var maxTime = this._normaliseDatetime(
			this._determineDatetime(inst, inst.options.maxTime), 'd');
		// Ensure it is within the bounds set
		datetime = (minDatetime && datetime < minDatetime ? minDatetime :
			(maxDatetime && datetime > maxDatetime ? maxDatetime : datetime));
		if (minTime && this._normaliseDatetime(new Date(datetime.getTime()), 'd') < minTime) {
			this._copyTime(minTime, datetime);
		}
		if (maxTime && this._normaliseDatetime(new Date(datetime.getTime()), 'd') > maxTime) {
			this._copyTime(maxTime, datetime);
		}
		inst._selectedYear = datetime.getFullYear();
		inst._selectedMonth = datetime.getMonth();
		inst._selectedDay = datetime.getDate();
		inst._selectedHour = datetime.getHours();
		inst._selectedMinute = datetime.getMinutes();
		inst._selectedSecond = datetime.getSeconds();
		this._showDatetime(inst);
	},

	/* Copy just the date portion of a date/time.
	   @param  dateFrom  (Date) the date/time to copy from
	   @param  dateTo    (Date) the date/time to copy to */
	_copyDate: function(dateFrom, dateTo) {
		dateTo.setFullYear(dateFrom.getFullYear());
		dateTo.setMonth(dateFrom.getMonth());
		dateTo.setDate(dateFrom.getDate());
	},

	/* Copy just the time portion of a date/time.
	   @param  timeFrom  (Date) the date/time to copy from
	   @param  timeTo    (Date) the date/time to copy to */
	_copyTime: function(timeFrom, timeTo) {
		timeTo.setHours(timeFrom.getHours());
		timeTo.setMinutes(timeFrom.getMinutes());
		timeTo.setSeconds(timeFrom.getSeconds());
	},

	/* A datetime may be specified as an exact value or a relative one.
	   @param  inst     (object) the instance settings
	   @param  setting  (Date) an actual datetime or
	                    (number) offset in seconds/days from now or
	                    (string) units and periods of offsets from now
	   @return  (Date) the calculated datetime */
	_determineDatetime: function(inst, setting) {
		var offsetNumeric = function(offset) { // E.g. +300, -2
			var datetime = new Date();
			datetime.setSeconds(datetime.getSeconds() + offset);
			return datetime;
		};
		var offsetString = function(offset) { // E.g. '+2m', '-4h', '+3h +30m'
			var datetime;
			try { // Check for string in current datetime format
				datetime = plugin._parseDatetime(inst, offset);
				if (datetime) {
					return datetime;
				}
			}
			catch (e) {
				// Ignore
			}
			offset = offset.toLowerCase();
			datetime = new Date();
			var year = datetime.getFullYear();
			var month = datetime.getMonth();
			var day = datetime.getDate();
			var hour = datetime.getHours();
			var minute = datetime.getMinutes();
			var second = datetime.getSeconds();
			var pattern = /([+-]?[0-9]+)\s*(s|m|h|d|w|o|y)?/g;
			var matches = pattern.exec(offset);
			while (matches) {
				switch (matches[2] || 's') {
					case 's':
						second += parseInt(matches[1], 10); break;
					case 'm':
						minute += parseInt(matches[1], 10); break;
					case 'h':
						hour += parseInt(matches[1], 10); break;
					case 'd':
						day += parseInt(matches[1], 10); break;
					case 'w':
						day += parseInt(matches[1], 10) * 7; break;
					case 'o':
						month += parseInt(matches[1], 10); break;
					case 'y':
						year += parseInt(matches[1], 10); break;
				}
				matches = pattern.exec(offset);
			}
			return new Date(year, month, day, hour, minute, second);
		};
		return (setting ? (typeof setting == 'string' ? offsetString(setting) :
			(typeof setting == 'number' ? offsetNumeric(setting) : setting)) : null);
	},

	/* Normalise datetime object.
	   @param  datetime  (Date) the original date/time
	   @param  type      (string) 'd' for retain date only, 't' for retain time only, null for neither
	   @return  (Date) the normalised datetime */
	_normaliseDatetime: function(datetime, type) {
		if (!datetime) {
			return null;
		}
		if (type == 'd') {
			datetime.setFullYear(0);
			datetime.setMonth(0);
			datetime.setDate(0);
		}
		if (type == 't') {
			datetime.setHours(12);
			datetime.setMinutes(0);
			datetime.setSeconds(0);
		}
		datetime.setMilliseconds(0);
		return datetime;
	},

	/* Update datetime based on keystroke entered.
	   @param  inst  (object) the instance settings
	   @param  chr   (ch) the new character */
	_handleKeyPress: function(inst, chr) {
		chr = chr.toLowerCase();
		var field = inst.options.datetimeFormat.charAt(inst._fields[inst._field]);
		var sep = inst.options.datetimeFormat.charAt(inst._fields[inst._field] + 1);
		sep = ('yYoOnNdDwWhHmMsSa'.indexOf(sep) == -1 ? sep : '');
		if ((inst.options.datetimeSeparators + sep).indexOf(chr) > -1) {
			this._changeField(inst, +1, false);
		}
		else if (chr >= '0' && chr <= '9') { // Allow direct entry of datetime
			var key = parseInt(chr, 10);
			var value = parseInt(inst._lastChr + chr, 10);
			var year = (!field.match(/y/i) ? inst._selectedYear : value);
			var month = (!field.match(/o|n/i) ? inst._selectedMonth + 1 :
				(value >= 1 && value <= 12 ? value : (key > 0 ? key : inst._selectedMonth + 1)));
			var day = (!field.match(/d|w/i) ? inst._selectedDay :
				(value >= 1 && value <= this._getDaysInMonth(year, month - 1) ?
				value : (key > 0 ? key : inst._selectedDay)));
			var hour = (!field.match(/h/i) ? inst._selectedHour : (inst._ampmField == -1 ?
				(value < 24 ? value : key) : (value >= 1 && value <= 12 ? value :
				(key > 0 ? key : inst._selectedHour)) % 12 + (inst._selectedHour >= 12 ? 12 : 0)));
			var minute = (!field.match(/m/i) ? inst._selectedMinute : (value < 60 ? value : key));
			var second = (!field.match(/s/i) ? inst._selectedSecond : (value < 60 ? value : key));
			var fields = this._constrainTime(inst, [hour, minute, second]);
			var shortYearCutoff = this._shortYearCutoff(inst);
			this._setDatetime(inst, new Date(
				year + (year >= 100 || field != 'y' ? 0 : (year > shortYearCutoff ? 1900 : 2000)),
				month - 1, day, fields[0], fields[1], fields[2]));
			inst._lastChr = (field != 'Y' ? '' :
				inst._lastChr.substr(Math.max(0, inst._lastChr.length - 2))) + chr;
		}
		else if (field.match(/n/i)) { // Allow text entry by month name
			inst._lastChr += chr;
			var names = inst.options[field == 'n' ? 'monthNamesShort' : 'monthNames'];
			var findMonth = function() {
				for (var i = 0; i < names.length; i++) {
					if (names[i].toLowerCase().substring(0, inst._lastChr.length) == inst._lastChr) {
						return i;
						break;
					}
				}
				return -1;
			};
			var month = findMonth();
			if (month == -1) {
				inst._lastChr = chr;
				month = findMonth();
			}
			if (month == -1) {
				inst._lastChr = '';
			}
			else {
				var year = inst._selectedYear;
				var day = Math.min(inst._selectedDay, this._getDaysInMonth(year, month));
				this._setDatetime(inst, this._normaliseDatetime(new Date(year, month, day,
					inst._selectedHour, inst._selectedMinute, inst._selectedSecond)));
			}
		}
		else if (inst._ampmField > -1) { // Set am/pm based on first char of names
			if ((chr == inst.options.ampmNames[0].substring(0, 1).toLowerCase() &&
					inst._selectedHour >= 12) ||
					(chr == inst.options.ampmNames[1].substring(0, 1).toLowerCase() &&
					inst._selectedHour < 12)) {
				var saveField = inst._field;
				inst._field = inst._ampmField;
				this._adjustField(inst, +1);
				inst._field = saveField;
				this._showField(inst);
			}
		}
	},

	/* Retrieve the short year cutoff value.
	   @param  inst    (object) the instance settings
	   @return  (number) the calculated cutoff year */
	_shortYearCutoff: function(inst) {
		var cutoff = inst.options.shortYearCutoff;
		if (typeof cutoff == 'string') {
			cutoff = new Date().getFullYear() + parseInt(cutoff, 10);
		}
		return cutoff % 100;
	},

	/* Constrain the given/current time to the time steps.
	   @param  inst    (object) the instance settings
	   @param  fields  (number[3]) the current time components (hours, minutes, seconds)
	   @return  (number[3]) the constrained time components (hours, minutes, seconds) */
	_constrainTime: function(inst, fields) {
		var specified = (fields != null);
		if (!specified) {
			var now = this._determineTime(inst, inst.options.defaultTime) || new Date();
			fields = [now.getHours(), now.getMinutes(), now.getSeconds()];
		}
		var reset = false;
		var timeSteps = inst.options.timeSteps;
		for (var i = 0; i < timeSteps.length; i++) {
			if (reset) {
				fields[i] = 0;
			}
			else if (timeSteps[i] > 1) {
				fields[i] = Math.round(fields[i] / timeSteps[i]) * timeSteps[i];
				reset = true;
			}
		}
		return fields;
	}
});

// The list of commands that return values and don't permit chaining
var getters = ['getDatetime', 'getOffset', 'isDisabled'];

/* Determine whether a command is a getter and doesn't permit chaining.
   @param  command    (string, optional) the command to run
   @param  otherArgs  ([], optional) any other arguments for the command
   @return  true if the command is a getter, false if not */
function isNotChained(command, otherArgs) {
	if (command == 'option' && (otherArgs.length == 0 ||
			(otherArgs.length == 1 && typeof otherArgs[0] == 'string'))) {
		return true;
	}
	return $.inArray(command, getters) > -1;
}

/* Attach the datetime entry functionality to a jQuery selection.
   @param  options  (object) the new settings to use for these instances (optional) or
                    (string) the command to run (optional)
   @return  (jQuery) for chaining further calls or
            (any) getter value */
$.fn.datetimeEntry = function(options) {
	var otherArgs = Array.prototype.slice.call(arguments, 1);
	if (isNotChained(options, otherArgs)) {
		return plugin['_' + options + 'Plugin'].
			apply(plugin, [this[0]].concat(otherArgs));
	}
	return this.each(function() {
		if (typeof options == 'string') {
			if (!plugin['_' + options + 'Plugin']) {
				throw 'Unknown command: ' + options;
			}
			plugin['_' + options + 'Plugin'].
				apply(plugin, [this].concat(otherArgs));
		}
		else {
			// Check for settings on the control itself
			var inlineSettings = ($.fn.metadata ? $(this).metadata() : {});
			plugin._attachPlugin(this, $.extend({}, inlineSettings, options || {}));
		}
	});
};

/* Initialise the datetime entry functionality. */
var plugin = $.datetimeEntry = new DatetimeEntry(); // Singleton instance

})(jQuery);
