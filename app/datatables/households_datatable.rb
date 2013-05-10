class HouseholdsDatatable

  delegate :params, :h, :link_to,  to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Household.count,
        iTotalDisplayRecords: households.total_entries,
        aaData: data
    }
  end

  private

  def data
    households.map do |household|
      [
          link_to(household.name, household),
          h(household.neighbors.count),
          h(household.last_visit.strftime("%B %e, %Y")),
      ]
    end
  end

  def households
    @households ||= fetch_households
  end

  def fetch_households
    household = Household.order("#{sort_column} #{sort_direction}")
    household = households.page(page).per_page(per_page)
    if params[:sSearch].present?
      households = households.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    households
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name count last_visit]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
end