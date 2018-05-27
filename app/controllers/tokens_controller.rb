class TokensController < ApplicationController

  before_filter :authenticate_user!

  expose(:households) {Household.scoped.includes(:neighbors, :visits).page params[:page]}
  expose(:household, strategy: StrongParametersStrategy)
  expose(:neighbors) {household.neighbors.includes(:visits)}
  expose(:neighbor)
  expose(:visits) {household.visits}
  expose(:visit)

  def index

    @q          = Token.includes(:neighbors, :visits).search(params[:q])
    @households = @q.result

  end

  def allowable
    [:issue_date, :expiration_date, :flavor, :tag, :household_id, :neighbor_id, :tab_trans_id,

     households_attributes: [
                                :household_name, :name, :box_type, :income1, :income2, :income3, :inc_amt1, :inc_amt2,
                                :inc_amt3, :expense1, :expense2, :expense3, :exp_amt1, :exp_amt2, :exp_amt3, :exp_amt4, :expense4,
                                :option1, :option2, :opt_val1, :opt_val2, :notes, :street, :apt, :state, :city, :zip,
                                :food_alert, :prayer_request, :money_notes, :special_needs, :how_heard,
                                :proof_of_residency_type, :date_of_proof, :post_prayer, :post_needs, :christmas,
                                :bool1, :bool_val1, :bool2, :bool_val2, :bool3, :bool_val3, :bool4, :bool_val4,
                                :bool5, :bool_val5, :s_numb, :s_box, :income4, :inc_amt4,
                                neighbors_attributes: [
                                                          :city, :close_date, :date_of_proof, :first_name, :middle_name, :street, :apt,
                                                          :food_stamps, :last_name, :monthly_income, :notes, :house_rank, :birth_date,
                                                          :open_date, :phone, :proof_of_residency_type, :email, :sex, :rent, :residency_date,
                                                          :proof_of_residency_type, :smokes, :spouse, :ssn, :state, :street,
                                                          :utilities, :zip, :age, :created_at, :updated_at, :neighbors_attributes, :encrypted_ssn
                                                      ],
                                visits_attributes:    [
                                                          :cereal, :starch, :option1, :option2, :optionb, :visited_on, :items_received, :notes,
                                                          :household_id, :neighbor_id
                                                      ]
                            ]
    ]


  end
end
