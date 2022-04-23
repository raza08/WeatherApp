//
//  CityWeatherListViewController.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

class CityWeatherListViewController: BaseViewController {

    
    let viewModel = CityWeatherViewModel()
    var selectedCityWeather : WeatherReport?
    var cityName = ""
    
    @IBOutlet weak var mainTableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<TBLSection,List>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.registerTblCells()
        self.viewModel.weatherReport = self.selectedCityWeather
        self.viewModel.fetchData()
        self.configureDataSource()
        self.createSnapshot()
        // Do any additional setup after loading the view.
    }
    
    func setup()  {
        self.title = self.cityName.capitalizingFirstLetter() 
    }
    
    
    func registerTblCells() {
        
        self.mainTableView.estimatedRowHeight = 80
        self.mainTableView.rowHeight = UITableView.automaticDimension
        self.mainTableView.register(UINib(nibName: CityWeatherViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CityWeatherViewCell.reuseIdentifier)

    }
    
    func configureDataSource(){
        dataSource = UITableViewDiffableDataSource<TBLSection,List>(tableView: self.mainTableView, cellProvider: { ( tableView, indexPath, list) -> UITableViewCell in
             
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherViewCell.reuseIdentifier, for: indexPath) as? CityWeatherViewCell else {
                return UITableViewCell()
            }
            cell.list = list
            return cell
        })
    }
    
    func createSnapshot()  {
        
        var snapShot = NSDiffableDataSourceSnapshot<TBLSection,List>()
        snapShot.appendSections([.First])
        snapShot.appendItems(self.viewModel.mainListData)
        dataSource.apply(snapShot)
        
    }
    
}


extension CityWeatherListViewController : UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailWeatherViewController = DetailWeatherViewController.storyboardInstance(StoryboardName: .Main)
        detailWeatherViewController.selectedList =  self.dataSource.itemIdentifier(for: indexPath)
        detailWeatherViewController.cityName = self.cityName
        self.navigationController?.pushViewController(detailWeatherViewController, animated: true)

        
    }
    
}
