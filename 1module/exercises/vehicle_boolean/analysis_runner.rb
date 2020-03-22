# analysis_runner.rb
require "./lib/vehicle"
require "./lib/vehicle_analysis"

vehicle = Vehicle.new("pickup", true, true)
VehicleAnalysis.new.analyze(vehicle)
