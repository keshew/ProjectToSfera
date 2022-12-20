//
//  FactViewControllerExtension.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit

//MARK: - Data Sourse
extension FactsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CoreDataManager.shared.fact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FactTableViewCell.identifier,for: indexPath) as? FactTableViewCell else { return UITableViewCell() }
        guard let image = CoreDataManager.shared.fact[indexPath.row].image else { return UITableViewCell() }
        cell.title.text = CoreDataManager.shared.fact[indexPath.row].title
        cell.descriptison.text = CoreDataManager.shared.fact[indexPath.row].fact
        cell.imageOfCoin.image = UIImage(data: image)
        return cell
    }
}
//MARK: - Delegate
extension FactsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // logic to presenter -> interactor
            CoreDataManager.shared.context.delete(CoreDataManager.shared.fact[indexPath.row])
            CoreDataManager.shared.fact.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            do {
                try CoreDataManager.shared.context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
