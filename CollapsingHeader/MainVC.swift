//
//  ViewController.swift
//  CollapsingHeader
//
//  Created by Leonardo  on 7/08/22.
//

import UIKit

final class MainVC: UIViewController {
  // MARK: DataSource
  lazy var characters: [Model] = Model.getSample()
  // MARK: - UI
  var headerView: UIView = {
    var view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGreen
    return view
  }()

  var headerTitleLabel: UILabel = {
    var label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Dr. Stone"
    label.textAlignment = .center
    label.textColor = .systemBackground
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()

  var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.backgroundColor = .systemBlue.withAlphaComponent(0.4)
    collection.register(CharacterCell.self, forCellWithReuseIdentifier: "CELL")
    collection.alwaysBounceVertical = true
    return collection
  }()

  // MARK: - Initializers
  init() {
    super.init(nibName: nil, bundle: Bundle.main)
    view.backgroundColor = .white
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MainVC {
  override func viewDidLoad() {
    print("viewDidLoad")
    setupUI()
    collectionView.dataSource = self
    collectionView.delegate = self
  }
}

private extension MainVC {
  func setupUI() {
    view.addSubview(headerView)
    view.addSubview(collectionView)
    headerView.addSubview(headerTitleLabel)
    /// HeaderView
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      headerView.heightAnchor.constraint(equalToConstant: 70)
    ])
    /// HeaderTitleLabel
    NSLayoutConstraint.activate([
      headerTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
      headerTitleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
      headerTitleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
      headerTitleLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
    /// CollectionView
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

extension MainVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! CharacterCell
    cell.backgroundColor = .systemBlue
    cell.characterTitle = characters[indexPath.item].name
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return characters.count
  }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width: CGFloat = view.frame.size.width * 0.9
    let height: CGFloat = view.frame.size.height * 0.2
    return CGSize(width: width, height: height)
  }
}

extension MainVC: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offset = scrollView.contentOffset.y
    print("offset: \(offset)")
  }
}
