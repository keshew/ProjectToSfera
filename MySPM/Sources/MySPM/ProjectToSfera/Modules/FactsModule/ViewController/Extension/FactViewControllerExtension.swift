//
//  FactViewControllerExtension.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit
import CoreData


extension FactsViewController: UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    //MARK: - NSFetchedResultsControllerDelegate
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .move:
            if let indexPath = indexPath {
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let indexPath = newIndexPath {
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                self.controllerDidChangeContent(CoreDataManager.shared.fetchResultController)
                let fact = CoreDataManager.shared.fetchResultController.object(at: indexPath) as! Facts
                let cell = self.tableView.cellForRow(at: indexPath) as! FactTableViewCell
                cell.title.text = fact.title
                cell.descriptison.text = fact.fact
                cell.imageOfCoin.image = UIImage(data: fact.image!)
            }
        @unknown default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    //MARK: -  UITableViewDataSource, UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let row = CoreDataManager.shared.fetchResultController.sections {
            return row[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FactTableViewCell.identifier,for: indexPath) as? FactTableViewCell else { return UITableViewCell() }
        let subj = CoreDataManager.shared.fetchResultController.object(at: indexPath) as! Facts
        guard let image = subj.image else { return UITableViewCell() }
        cell.title.text = subj.title
        cell.descriptison.text = subj.fact
        cell.imageOfCoin.image = UIImage(data: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let object = CoreDataManager.shared.fetchResultController.object(at: indexPath) as! Facts
            CoreDataManager.shared.context.delete(object)
            do {
                try CoreDataManager.shared.context.save()
            } catch {
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
}
