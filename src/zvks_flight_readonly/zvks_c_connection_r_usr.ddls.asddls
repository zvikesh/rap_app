@EndUserText.label: 'Connection View - CDS Data Model'
@Metadata:{
    allowExtensions: true,
    ignorePropagatedAnnotations: true
}
@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZVKS_C_Connection_R_Usr
  as select from ZVKS_R_Connection as Connection
  /* Object Page Association */
  association [1..*] to ZVKS_C_Flight_R_Usr as _Flight      on $projection.ConnectionUUID = _Flight.ConnectionUUID
  /* Data Association */
  association [1]    to ZVKS_R_Carrier      as _Airline     on $projection.CarrierUUID = _Airline.CarrierUUID
  association [1]    to ZVKS_R_Airport      as _AirportFrom on $projection.AirportFromUUID = _AirportFrom.AirportUUID
  association [1]    to ZVKS_R_Airport      as _AirportTo   on $projection.AirportToUUID = _AirportTo.AirportUUID
{
  key   Connection.ConnectionUUID,
        Connection.CarrierUUID,
        Connection.AirportFromUUID,
        Connection.AirportToUUID,
        
        @ObjectModel.text.association: '_Airline'
        @ObjectModel.text.element: ['AirlineName']
        _Airline.CarrierID       as AirlineID,
        _Airline.Name            as AirlineName,
        
        Connection.ConnectionID,
        
        @ObjectModel.text.element: ['DepartureAirportName']
        _AirportFrom.AirportID   as DepartureAirport,
        _AirportFrom.Name        as DepartureAirportName,
        
        @ObjectModel.text.element: ['DestinationAirportName']        
        _AirportTo.AirportID     as DestinationAirport,
        _AirportFrom.Name        as DestinationAirportName,
        
        Connection.DepartureTime as DepartureTime,
        Connection.ArrivalTime   as ArrivalTime,
        @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
        Connection.Distance      as Distance,
        Connection.DistanceUnit  as DistanceUnit,

        /* Associations */
        _Flight,
        _Airline
}
