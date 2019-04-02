# GPS Speed CarPlay problem
We noticed since iOS 11 that in some specific car models, the GPS speed that `didUpdateLocations` of the `CLLocationManager` returns is significantly different when connected to CarPlay compared to without. 

In most cases the speed is ~10km/h (~6mph) higher than without connection to CarPlay. It doesn't seem to be related to CarPlay Navigation support in iOS, as this demo project doesn't have that and the issue still occurs. 

# Note
It only seems to occur on specific car models. 

Models that we have confirmed this issue occurs in: 

- Volvo XC90
- Ford transit with Sync 3
- Renault Megane IV model 2018 with Rlink2 and latest firmware
- Opel Astra station (2018)
- Ford Focus 2017
- Opel Astra (model K, 2017) — Gets half of GPS speed
- Ford Mondeo of 2019
