//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .blue

        let userCard = UserCard()
        view.addSubview(userCard)
        userCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        userCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        userCard.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true

        self.view = view
    }
}

/// A view 160 points height.
class UserCard: UIView {

    let blue = UIColor(red: 0.1765, green: 0.3569, blue: 0.9765, alpha: 1.0)
    let gray = UIColor(red: 0.9333, green: 0.9020, blue: 0.9961, alpha: 1.0)

    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let jobLabel = UILabel()
    let viewProfileButton = UIButton()
    let changeStatusButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 4

        heightAnchor.constraint(equalToConstant: 152).isActive = true

        addSubview(profileImageView)
        addSubview(jobLabel)
        addSubview(nameLabel)
        addSubview(viewProfileButton)
        addSubview(changeStatusButton)
        
        setupProfileImageView()
        setupNameLabel()
        setupJobLabel()
        setupViewProfileButton()
        setupChangeStatusButton()
    }

    private func setupProfileImageView() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false

        profileImageView.backgroundColor = .orange
        profileImageView.layer.cornerRadius = 28
        profileImageView.layer.masksToBounds = true
        profileImageView.image = UIImage(named: "Nallo.jpg")
        profileImageView.contentMode = .scaleAspectFill

        profileImageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    }

    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.text = "Stefano Martinallo"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)

        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 8).isActive = true
    }

    private func setupJobLabel() {
        jobLabel.translatesAutoresizingMaskIntoConstraints = false

        jobLabel.text = "Software Engineer"
        jobLabel.textColor = .lightGray
        jobLabel.font = UIFont.systemFont(ofSize: 14)

        jobLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8).isActive = true
        jobLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        jobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
    }

    private func setupViewProfileButton() {
        viewProfileButton.translatesAutoresizingMaskIntoConstraints = false
        
        viewProfileButton.backgroundColor = self.blue
        viewProfileButton.layer.cornerRadius = 4
        viewProfileButton.setTitle("View Profile", for: .normal)
        viewProfileButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        viewProfileButton.setTitleColor(.white, for: .normal)
        
        viewProfileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        viewProfileButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        viewProfileButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewProfileButton.widthAnchor.constraint(equalTo: changeStatusButton.widthAnchor).isActive = true
    }

    private func setupChangeStatusButton() {
        changeStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        changeStatusButton.backgroundColor = self.gray
        changeStatusButton.layer.cornerRadius = 4
        changeStatusButton.setTitle("Change Status", for: .normal)
        changeStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        changeStatusButton.setTitleColor(self.blue, for: .normal)
        
        changeStatusButton.leadingAnchor.constraint(equalTo: viewProfileButton.trailingAnchor, constant: 16).isActive = true
        changeStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        changeStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        changeStatusButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

let vc = MyViewController()

// iPhone X
vc.preferredContentSize = CGSize(width: 375, height: 812)
PlaygroundPage.current.liveView = vc
