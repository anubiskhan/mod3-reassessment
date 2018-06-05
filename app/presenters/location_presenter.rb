class LocationPresenter
  def initialize(location)
    @location_service = LocationService.new(location)
  end

  def entity_type
    @location_service.location_body['location_suggestions'][0]['entity_type']
  end

  def entity_id
    @location_service.location_body['location_suggestions'][0]['entity_id']
  end
end
