@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier View - CDS Data Model'
@Search.searchable: true
define view entity ZVKS_C_Flight_R_Usr
  as select from ZVKS_R_Flight as Flight
  association [1] to ZVKS_R_Carrier as _Airline on $projection.CarrierUUID = _Airline.CarrierUUID
{

  key Flight.FlightUUID     as FlightUUID,
      Flight.CarrierUUID    as CarrierUUID,
      Flight.ConnectionUUID as ConnectionUUID,

      //      @UI.lineItem: [ { position: 10, label: 'Airline'} ]
      //      @Search.defaultSearchElement: true
      //      @Search.fuzzinessThreshold: 0.7
      //      @ObjectModel.text.association: '_Airline'
      //  key Flight.carrier_id     as AirlineID,
      //
      //      @UI.lineItem: [ { position: 20, label: 'Connection Number' } ]
      //  key Flight.connection_id  as ConnectionID,

      @UI.lineItem: [ { position: 30, label: 'Flight Date' } ]
      Flight.FlightDate,

      @UI.lineItem: [ { position: 40, label: 'Price' } ]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Flight.Price,

      Flight.CurrencyCode,

      @UI.lineItem: [ { position: 50, label: 'Plane Type' } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Flight.PlaneTypeId    as PlaneType,

      @UI.lineItem: [ { position: 60, label: 'Maximum Seats' } ]
      Flight.SeatsMax       as MaximumSeats,

      @UI.lineItem: [ { position: 70, label: 'Occupied Seats' } ]
      Flight.SeatsOccupied  as OccupiedSeats,

      /* Associations */
      _Airline
}
