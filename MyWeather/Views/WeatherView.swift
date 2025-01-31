//
//  WeatherView.swift
//  MyWeather
//
//  Created by Abdul Hassan on 1/30/25.
//

import SwiftUI

struct WeatherView: View {
    var viewModel: WeatherModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading) {
                    Text(viewModel.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(viewModel.weather[0].main)
                        }
                        .frame(maxWidth: 140)
                        
                        Spacer()
                        
                        Text(viewModel.main.feelsLike.roundDouble() + "° F")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (viewModel.main.tempMin.roundDouble() + "° F"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (viewModel.main.tempMax.roundDouble() + "° F"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (viewModel.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (viewModel.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.689, saturation: 0.689, brightness: 0.493))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .foregroundStyle(.white)
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.689, saturation: 0.689, brightness: 0.493))
    }
}

#Preview {
    WeatherView(viewModel: previewWeather)
}
