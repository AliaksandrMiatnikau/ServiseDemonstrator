
import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    // MARK: Properties
    
    private let mainScreenScrollView = UIScrollView()
    private let mainScreenScrollViewContainer = UIStackView()
    private let contentView = UIView()
    
    private let titleView = UIView()
    private let textLabelTitleView = UILabel()
    private let updateButton = UIButton()
    private let clearButton = UIButton()
    private let mainTextField = UITextView()
    
    private let checkBoxTitle = UILabel()
    
    private let firstCheckBoxButton = UIButton()
    private var boolFirstCheckBoxButton = true
    private let firstCheckBoxLabel = UILabel()
    private var firstCheckbox = 0
    
    private let secondCheckBoxButton = UIButton()
    private var boolSecondCheckBoxButton = false
    private let secondCheckBoxTitle = UILabel()
    private var secondCheckbox = 0
    
    private let thirdCheckBoxButton = UIButton()
    private var boolThirdCheckBoxButton = false
    private let thirdCheckBoxTitle = UILabel()
    private var thirdCheckbox = 0
    
    
    private let switcherTitle = UILabel()
    
    private let firstSwitcherButton = UIButton()
    private var boolFirstSwitcherButton = false
    private let firstSwitcherLabel = UILabel()
    
    private let secondSwitcherButton = UIButton()
    private var boolSecondSwitcherButton = false
    private let secondSwitcherLabel = UILabel()
    
    private let thirdSwitcherButton = UIButton()
    private var boolThirdSwitcherButton = false
    private let thirdSwitcherLabel = UILabel()
    
    private let infoPickerTitle = UILabel()
    
    private let optionsTextField = UITextField()
    private let options = ["option1", "option2", "option3"]
    private var pickerView = UIPickerView()
    
    private let resultButton = UIButton()
    private let resultLabel = UILabel()
    private let resultTextView = UITextView()
 
    private var outputResult = ""
    private var radiobutton = ""
    
    private var startText = "Груша цвіла апошні год. Усе галіны яе, усе вялікія расохі, да апошняга пруціка, былі ўсыпаны буйным бела-ружовым цветам. Яна кіпела, млела і раскашавалася ў пчаліным звоне, цягнула да сонца сталыя лапы і распускала ў яго ззянні маленькія, кволыя пальцы новых парасткаў. І была яна такая магутная і свежая, так утрапёна спрачаліся ў яе ружовым раі пчолы, што, здавалася, не будзе ёй зводу і не будзе ёй канца."
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupScrollViewContainer()
        setupContentView()
        
        setupInfoView()
        setupTextLabelForInfoView()
        setupUpdateButton()
        setupClearButton()
        setupMainTextView()
        
        setupInfoLabelCheckBox()
        setupFirstCheckBoxButton()
        setupFirstCheckBoxLabel()
        
        setupSecondCheckBoxButton()
        setupSecondCheckBoxLabel()
        
        setupThirdCheckBoxButton()
        setupThirdCheckBoxLabel()
        
        setupInfoLabelSwitcher()
        
        setupFirstSwitcherButton()
        setupFirstSwitcherLabel()
        setupSecondSwitcherButton()
        setupSecondSwitcherLabel()
        setupThirdSwitcherButton()
        setupThirdSwitcherLabel()
        
        
        setupInfoLabelOptions()
        setupOptionsTextField()
        setupButtonShowResult()
    }
    
    // MARK: Functions
    
    func setupScrollView() {
        mainScreenScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainScreenScrollView)
        mainScreenScrollView.addSubview(contentView)
        mainScreenScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainScreenScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainScreenScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainScreenScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: mainScreenScrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: mainScreenScrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: mainScreenScrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: mainScreenScrollView.bottomAnchor).isActive = true
    }
    
    private func setupScrollViewContainer() {
        mainScreenScrollView.addSubview(mainScreenScrollViewContainer)
        mainScreenScrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainScreenScrollViewContainer.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor),
            mainScreenScrollViewContainer.trailingAnchor.constraint(equalTo: mainScreenScrollView.trailingAnchor),
            mainScreenScrollViewContainer.topAnchor.constraint(equalTo: mainScreenScrollView.topAnchor),
            mainScreenScrollViewContainer.bottomAnchor.constraint(equalTo: mainScreenScrollView.bottomAnchor),
            mainScreenScrollViewContainer.widthAnchor.constraint(equalTo: mainScreenScrollView.widthAnchor)
        ])
    }
    
    private func setupContentView() {
        mainScreenScrollViewContainer.addArrangedSubview(contentView)
        contentView.heightAnchor.constraint(equalToConstant: 1700).isActive = true
        contentView.backgroundColor = .white
    }
    
    private func setupInfoView() {
        contentView.addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = .white
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: mainScreenScrollViewContainer.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: mainScreenScrollViewContainer.trailingAnchor),
            titleView.topAnchor.constraint(equalTo: mainScreenScrollViewContainer.topAnchor, constant: 70),
            titleView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupTextLabelForInfoView() {
        titleView.addSubview(textLabelTitleView)
        textLabelTitleView.translatesAutoresizingMaskIntoConstraints = false
        textLabelTitleView.text = "Please, enter a text"
        textLabelTitleView.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        NSLayoutConstraint.activate([
            textLabelTitleView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            textLabelTitleView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupUpdateButton() {
        titleView.addSubview(updateButton)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.setTitle("🔄", for: .normal)
        updateButton.addTarget(self, action: #selector(updateText), for: .touchUpInside)
        updateButton.backgroundColor = .white
        NSLayoutConstraint.activate([
            updateButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            updateButton.widthAnchor.constraint(equalToConstant: 40),
            updateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupClearButton() {
        titleView.addSubview(clearButton)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("❌", for: .normal)
        clearButton.backgroundColor = .white
        clearButton.addTarget(self, action: #selector(clearMainTextView), for: .touchUpInside)
        NSLayoutConstraint.activate([
            clearButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            clearButton.leadingAnchor.constraint(equalTo: updateButton.trailingAnchor),
            clearButton.widthAnchor.constraint(equalToConstant: 40),
            clearButton.heightAnchor.constraint(equalToConstant: 40),
            clearButton.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -10)
        ])
    }
    
    
    
    private func setupMainTextView() {
        contentView.addSubview(mainTextField)
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        mainTextField.layer.borderWidth = 0.5
        mainTextField.font = .systemFont(ofSize: 20, weight: .light)
        mainTextField.text = startText
        mainTextField.backgroundColor = .white
        mainTextField.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            mainTextField.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            mainTextField.trailingAnchor.constraint(equalTo: mainScreenScrollView.trailingAnchor, constant: -10),
            mainTextField.topAnchor.constraint(equalTo: mainScreenScrollView.topAnchor, constant: 130),
            mainTextField.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupInfoLabelCheckBox() {
        contentView.addSubview(checkBoxTitle)
        checkBoxTitle.translatesAutoresizingMaskIntoConstraints = false
        checkBoxTitle.text = "Select checkboxes:"
        NSLayoutConstraint.activate([
            checkBoxTitle.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            checkBoxTitle.topAnchor.constraint(equalTo: mainTextField.bottomAnchor, constant: 50)
        ])
    }
    
    private func setupFirstCheckBoxButton() {
        contentView.addSubview(firstCheckBoxButton)
        firstCheckBoxButton.translatesAutoresizingMaskIntoConstraints = false
        firstCheckBoxButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        firstCheckBoxButton.addTarget(self, action: #selector(changeImageFirstCheckButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            firstCheckBoxButton.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            firstCheckBoxButton.topAnchor.constraint(equalTo: checkBoxTitle.topAnchor, constant: 30),
            firstCheckBoxButton.widthAnchor.constraint(equalToConstant: 25),
            firstCheckBoxButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupFirstCheckBoxLabel() {
        contentView.addSubview(firstCheckBoxLabel)
        firstCheckBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        firstCheckBoxLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        firstCheckBoxLabel.text = "checkbox #1"
        
        NSLayoutConstraint.activate([
            firstCheckBoxLabel.leadingAnchor.constraint(equalTo: firstCheckBoxButton.trailingAnchor, constant: 5),
            firstCheckBoxLabel.topAnchor.constraint(equalTo: firstCheckBoxButton.topAnchor, constant: 2)
        ])
    }
    
    private func setupSecondCheckBoxButton() {
        contentView.addSubview(secondCheckBoxButton)
        secondCheckBoxButton.translatesAutoresizingMaskIntoConstraints = false
        secondCheckBoxButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        secondCheckBoxButton.addTarget(self, action: #selector(changeImageSecondCheckButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            secondCheckBoxButton.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            secondCheckBoxButton.topAnchor.constraint(equalTo: firstCheckBoxButton.bottomAnchor, constant: 10),
            secondCheckBoxButton.widthAnchor.constraint(equalToConstant: 25),
            secondCheckBoxButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupSecondCheckBoxLabel() {
        contentView.addSubview(secondCheckBoxTitle)
        secondCheckBoxTitle.translatesAutoresizingMaskIntoConstraints = false
        secondCheckBoxTitle.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        secondCheckBoxTitle.text = "checkbox #2"
        NSLayoutConstraint.activate([
            secondCheckBoxTitle.leadingAnchor.constraint(equalTo: secondCheckBoxButton.trailingAnchor, constant: 5),
            secondCheckBoxTitle.topAnchor.constraint(equalTo: secondCheckBoxButton.topAnchor, constant: 2)
        ])
    }
    
    private func setupThirdCheckBoxButton() {
        contentView.addSubview(thirdCheckBoxButton)
        thirdCheckBoxButton.translatesAutoresizingMaskIntoConstraints = false
        thirdCheckBoxButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        thirdCheckBoxButton.addTarget(self, action: #selector(changeImageThirdCheckButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            thirdCheckBoxButton.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            thirdCheckBoxButton.topAnchor.constraint(equalTo: secondCheckBoxButton.bottomAnchor, constant: 10),
            thirdCheckBoxButton.widthAnchor.constraint(equalToConstant: 25),
            thirdCheckBoxButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupThirdCheckBoxLabel() {
        contentView.addSubview(thirdCheckBoxTitle)
        thirdCheckBoxTitle.translatesAutoresizingMaskIntoConstraints = false
        thirdCheckBoxTitle.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        thirdCheckBoxTitle.text = "checkbox #3"
        NSLayoutConstraint.activate([
            thirdCheckBoxTitle.leadingAnchor.constraint(equalTo: thirdCheckBoxButton.trailingAnchor, constant: 5),
            thirdCheckBoxTitle.topAnchor.constraint(equalTo: thirdCheckBoxButton.topAnchor, constant: 2)
        ])
    }
    
    private func setupInfoLabelSwitcher() {
        contentView.addSubview(switcherTitle)
        switcherTitle.translatesAutoresizingMaskIntoConstraints = false
        switcherTitle.text = "Select radiobutton:"
        NSLayoutConstraint.activate([
            switcherTitle.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            switcherTitle.topAnchor.constraint(equalTo: thirdCheckBoxButton.bottomAnchor, constant: 30)
        ])
    }
    
    private func setupFirstSwitcherButton() {
        contentView.addSubview(firstSwitcherButton)
        firstSwitcherButton.translatesAutoresizingMaskIntoConstraints = false
        firstSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        firstSwitcherButton.addTarget(self, action: #selector(changeImageFirstSwicherButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            firstSwitcherButton.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            firstSwitcherButton.topAnchor.constraint(equalTo: switcherTitle.topAnchor, constant: 30),
            firstSwitcherButton.widthAnchor.constraint(equalToConstant: 25),
            firstSwitcherButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupFirstSwitcherLabel() {
        contentView.addSubview(firstSwitcherLabel)
        firstSwitcherLabel.translatesAutoresizingMaskIntoConstraints = false
        firstSwitcherLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        firstSwitcherLabel.text = "radiobutton #1"
        NSLayoutConstraint.activate([
            firstSwitcherLabel.leadingAnchor.constraint(equalTo: firstSwitcherButton.trailingAnchor, constant: 5),
            firstSwitcherLabel.topAnchor.constraint(equalTo: firstSwitcherButton.topAnchor, constant: 2)
        ])
    }
    
    private func setupSecondSwitcherButton() {
        contentView.addSubview(secondSwitcherButton)
        secondSwitcherButton.translatesAutoresizingMaskIntoConstraints = false
        secondSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        secondSwitcherButton.addTarget(self, action: #selector(changeImageSecondSwicherButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            secondSwitcherButton.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            secondSwitcherButton.topAnchor.constraint(equalTo: firstSwitcherLabel.bottomAnchor, constant: 10),
            secondSwitcherButton.widthAnchor.constraint(equalToConstant: 25),
            secondSwitcherButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupSecondSwitcherLabel() {
        contentView.addSubview(secondSwitcherLabel)
        secondSwitcherLabel.translatesAutoresizingMaskIntoConstraints = false
        secondSwitcherLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        secondSwitcherLabel.text = "radiobutton #2"
        NSLayoutConstraint.activate([
            secondSwitcherLabel.leadingAnchor.constraint(equalTo: secondSwitcherButton.trailingAnchor, constant: 5),
            secondSwitcherLabel.topAnchor.constraint(equalTo: secondSwitcherButton.topAnchor, constant: 2)
        ])
    }
    
    private func setupThirdSwitcherButton() {
        contentView.addSubview(thirdSwitcherButton)
        thirdSwitcherButton.translatesAutoresizingMaskIntoConstraints = false
        thirdSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        thirdSwitcherButton.addTarget(self, action: #selector(changeImageThirdSwicherButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            thirdSwitcherButton.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            thirdSwitcherButton.topAnchor.constraint(equalTo: secondSwitcherLabel.bottomAnchor, constant: 10),
            thirdSwitcherButton.widthAnchor.constraint(equalToConstant: 25),
            thirdSwitcherButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupThirdSwitcherLabel() {
        contentView.addSubview(thirdSwitcherLabel)
        thirdSwitcherLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdSwitcherLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        thirdSwitcherLabel.text = "radiobutton #3"
        NSLayoutConstraint.activate([
            thirdSwitcherLabel.leadingAnchor.constraint(equalTo: thirdSwitcherButton.trailingAnchor, constant: 5),
            thirdSwitcherLabel.topAnchor.constraint(equalTo: thirdSwitcherButton.topAnchor, constant: 2)
        ])
    }
    
    private func setupInfoLabelOptions() {
        contentView.addSubview(infoPickerTitle)
        infoPickerTitle.translatesAutoresizingMaskIntoConstraints = false
        infoPickerTitle.text = "Select option:"
        NSLayoutConstraint.activate([
            infoPickerTitle.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            infoPickerTitle.topAnchor.constraint(equalTo: thirdSwitcherButton.bottomAnchor, constant: 30)
            
        ])
    }
    
    private func setupOptionsTextField() {
        contentView.addSubview(optionsTextField)
        optionsTextField.translatesAutoresizingMaskIntoConstraints = false
        optionsTextField.layer.borderWidth = 0.5
        optionsTextField.layer.cornerRadius = 10
        optionsTextField.textAlignment = .center
        optionsTextField.placeholder = options.first
        pickerView.delegate = self
        pickerView.dataSource = self
        optionsTextField.inputView = pickerView
        NSLayoutConstraint.activate([
            optionsTextField.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            optionsTextField.topAnchor.constraint(equalTo: infoPickerTitle.topAnchor, constant: 30),
            optionsTextField.trailingAnchor.constraint(equalTo: mainScreenScrollView.trailingAnchor, constant: -10),
            optionsTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupButtonShowResult() {
        contentView.addSubview(resultButton)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        resultButton.backgroundColor = .systemCyan
        resultButton.setTitle("Show input text and selected settings", for: .normal)
        resultButton.titleLabel?.textAlignment = .center
        resultButton.layer.cornerRadius = 10
        resultButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        resultButton.addTarget(self, action: #selector(showResult), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resultButton.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 15),
            resultButton.topAnchor.constraint(equalTo: optionsTextField.bottomAnchor, constant: 20),
            resultButton.trailingAnchor.constraint(equalTo: mainScreenScrollView.trailingAnchor, constant: -15),
            resultButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupResultLabel() {
        contentView.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        resultLabel.text = "Result"
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            resultLabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 30)
        ])
    }
    
    private func setupResultTextView(with: OutputInfo) {
        contentView.addSubview(resultTextView)
        resultTextView.translatesAutoresizingMaskIntoConstraints = false
        resultTextView.backgroundColor = .systemGray
        resultTextView.layer.cornerRadius = 10
        resultTextView.text = with.result
        resultTextView.font = .systemFont(ofSize: 20, weight: .light)
        NSLayoutConstraint.activate([
            resultTextView.leadingAnchor.constraint(equalTo: mainScreenScrollView.leadingAnchor, constant: 10),
            resultTextView.trailingAnchor.constraint(equalTo: mainScreenScrollView.trailingAnchor, constant: -10),
            resultTextView.topAnchor.constraint(equalTo: resultLabel.topAnchor, constant: 30),
            resultTextView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        
        
    }
    
    
    
    func postRequest (completion: @escaping (Result<OutputInfo, Error>) -> Void){
        let parameters: [String: Any] = [
            
            
            "text" : mainTextField.text as String,
            "checkbox1": firstCheckbox,
            "checkbox2" : secondCheckbox,
            "checkbox3" : thirdCheckbox,
            "mode": radiobutton,
            "selector": (optionsTextField.text ?? String.self)
            
        ]
        AF.request("https://corpus.by/ServiceDemonstrator/api.php",
                   method: .post,
                   parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                guard let text = json["text"].string,
                      let result = json["result"].string
                        
                else {
                    completion(.failure(NetworkErrors.FailedToFetchData))
                    return }
                
                completion(.success(OutputInfo(text: text, result: result)))
                print(OutputInfo.self)
            case .failure(_):
                completion( .failure(NetworkErrors.FailedToFetchData))
            }
        }
    }
    
    
    // MARK: objc functions
    
    @objc func clearMainTextView() {
        mainTextField.text = ""
    }
    @objc func updateText() {
        mainTextField.text = startText
    }
    
    @objc func showResult() {
        setupResultLabel()
        postRequest { result  in
            switch result {
            case .success(let text):
                DispatchQueue.main.async {[weak self] in
                    guard let self = self else {
                        return
                    }
                    self.setupResultTextView(with: text)
                    print(text)
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    
    @objc func changeImageFirstCheckButton() {
        boolFirstCheckBoxButton.toggle()
        if boolFirstCheckBoxButton == false {
            firstCheckBoxButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
            firstCheckbox = 0
        } else {
            firstCheckBoxButton.setBackgroundImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            firstCheckbox = 1
        }
    }
    
    @objc func changeImageSecondCheckButton() {
        boolSecondCheckBoxButton.toggle()
        if boolSecondCheckBoxButton == false {
            secondCheckBoxButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
            secondCheckbox = 0
        } else {
            secondCheckBoxButton.setBackgroundImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            secondCheckbox = 1
        }
    }
    
    @objc func changeImageThirdCheckButton() {
        boolThirdCheckBoxButton.toggle()
        if boolThirdCheckBoxButton == false {
            thirdCheckBoxButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
            thirdCheckbox = 0
        } else {
            thirdCheckBoxButton.setBackgroundImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            thirdCheckbox = 1
        }
    }
    
    @objc func changeImageFirstSwicherButton() {
        boolFirstSwitcherButton.toggle()
        if boolFirstSwitcherButton == false {
            firstSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            radiobutton = ""
        } else {
            firstSwitcherButton.setBackgroundImage(UIImage(systemName: "record.circle.fill"), for: .normal)
            secondSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirdSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            boolSecondSwitcherButton = false
            boolThirdSwitcherButton = false
            radiobutton = "radiobutton1"
            
        }
    }
    
    @objc func changeImageSecondSwicherButton() {
        boolSecondSwitcherButton.toggle()
        if boolSecondSwitcherButton == false {
            secondSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            radiobutton = ""
        } else {
            secondSwitcherButton.setBackgroundImage(UIImage(systemName: "record.circle.fill"), for: .normal)
            firstSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirdSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            boolFirstSwitcherButton = false
            boolThirdSwitcherButton = false
            radiobutton = "radiobutton2"
            
        }
    }
    
    @objc func changeImageThirdSwicherButton() {
        boolThirdSwitcherButton.toggle()
        if boolThirdSwitcherButton == false {
            thirdSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            radiobutton = ""
        } else {
            thirdSwitcherButton.setBackgroundImage(UIImage(systemName: "record.circle.fill"), for: .normal)
            firstSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            secondSwitcherButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            boolFirstSwitcherButton = false
            boolSecondSwitcherButton = false
            radiobutton = "radiobutton3"
            
        }
    }
}

// MARK: extensions

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        optionsTextField.text = options[row]
        //        guard let item = optionsTextField.text else { return }
        //        checkersSummary.insert(item)
        optionsTextField.resignFirstResponder()
    }
}

public enum NetworkErrors: Error {
    case FailedToFetchData
    
}

