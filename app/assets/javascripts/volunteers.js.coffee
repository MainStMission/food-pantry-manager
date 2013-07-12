$ ->
  $('time').timeago()

  updateVolunteers = ->
    volunteers_id = $("#volunteers")
    $.getScript("/time_clock", ->
      $('time').timeago()
    )
    setTimeout(updateVolunteers, 5000);

  updateVolunteers()



