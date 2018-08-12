# -*- encoding : utf-8 -*-
class Household < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :household_name, presence: {message: 'You must enter a Household name'}
  validates :household_name, uniqueness: {message: 'We already have that Household'}
  validates :neighbors, presence: {message: 'You must enter at least one neighbor'}
  validates :inc_amt1, :inc_amt2, :inc_amt3, :exp_amt1, :exp_amt2, :exp_amt3, numericality: true, allow_nil: true
  

  has_many :neighbors    , dependent: :delete_all
  has_many :visits       , dependent: :delete_all
  has_many :foodlines    , dependent: :delete_all
  has_many :tokens       , dependent: :delete_all

  has_many :foods, through: :foodlines

  accepts_nested_attributes_for :neighbors, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :visits, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :tokens, allow_destroy: true, reject_if: :all_blank
  

  # after_save: print_receipt

  has_paper_trail
  max_paginates_per 20

  default_scope order('household_name ASC')

  def name
    household_name
  end

  def box
    [s_box.to_s, s_numb.to_s].join "-"
  end


  def thumbs
    if self.bool3
      "<i class='icon-ok'></i>"
    else
      "<i class='icon-check-empty'></i>"
    end
  end


  def neighbor_count
    self.neighbors.count
  end

  def young_neighbor
    self.neighbors.young.count
  end

  def middle_neighbor
    self.neighbors.middle.count
  end

  def old_neighbor
    self.neighbors.old.count
  end

  def visit
    self.visits
  end

  def last_visit
    if self.visits.count > 0
      self.visits.find(:first, :order => "visited_on DESC").visited_on.strftime('%B %d')
    else
      'No Visits Yet'
    end
  end


  def initial_token_value_display
    if token_open?
      tokens.find(:first, :order => "expiration_date").initial_value.to_s
    elsif token_expired?
      'Expired'
    else
      'No Token Issued'
    end
  end

  def token_balance
    if token_open?
      @tab = tokens.open_token.first
      @tab.initial_value - @tab.visit.map(&:tab).compact.sum
    elsif token_expired?
      'Expired'
    else
        'NTI'
    end
  end


  def token_expired?
    if tokens.open_token.count == 0 && tokens.expired_token.count >= 1
      true
    else
      false
    end
  end

  def token_open?
    if tokens.open_token.count == 1
      true
    else
      false
    end
  end


  def token_expiration
    if token_open?  
         @token = tokens.open_token.first
         @token.expiration_date.strftime('%D')
    elsif token_expired? 
    'Expired'
    else
      'NTI'
    end
  end

  def token_renew
    if token_open?
      @token = tokens.open_token.first
      @token.expiration_date.to_date.next_day.strftime('%D')
    elsif token_expired?
      'Expired'
    else
      'NTI'
    end
  end

  def token_issuance
    if token_open?
      @token = tokens.open_token.first
      @token.issue_date.strftime('%D')
    elsif token_expired?
      'Expired' 
    else
      'Not Token'
    end 
  end

  def expired_token_date 
    if token.open_token.count == 0 && token.expired_token.count >= 1 
      @token = tokens.expired_token.first
      @token.expiration_date.strftime('%D')
    end
  end
       

  def check_token
      if tokens.count > 0
         @token = tokens.find(:first, :order => "expiration_date")
         @token.household.household_name
      else
        @household.household_name
    end
  end

end


