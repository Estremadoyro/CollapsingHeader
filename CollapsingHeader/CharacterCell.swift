//
//  CharacterCell.swift
//  CollapsingHeader
//
//  Created by Leonardo  on 7/08/22.
//

import Foundation
import UIKit

final class CharacterCell: UICollectionViewCell {
  // MARK: - Properties
  var characterTitle: String? {
    didSet {
      titleLabel.text = characterTitle
    }
  }

  // MARK: - UI
  var containerView: UIView = {
    var view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  var titleLabel: UILabel = {
    var label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .left
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()

  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CharacterCell {
  func setupUI() {
    contentView.addSubview(containerView)
    containerView.addSubview(titleLabel)
    /// ContainerView
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])

    /// TitleLabel
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
      titleLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
    ])
  }
}
