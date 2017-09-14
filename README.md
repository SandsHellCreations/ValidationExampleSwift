ValidationExampleSwift
Validation code using tuples and variadic parameters...

Variadic parameter example:-
--------------------------------------------------------------------
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
    return total / Double(numbers.count)
    }
    arithmeticMean(1, 2, 3, 4, 5)
    // returns 3.0, which is the arithmetic mean of these five numbers
    arithmeticMean(3, 8.25, 18.75)
    // returns 10.0, which is the arithmetic mean of these three numbers
Tuple usage tutorial link: https://medium.com/swift-programming/swift-tuple-328aecff50e7
----------------------------------------------------------------------
Usage Example of validation with three values
----------------------------------------------------------------------
    let response = Validation.shared.validate(values: (ValidationType.email, "hello@gmail.com"), (ValidationType.phoneNo, "56545654654665"), (ValidationType.stringWithFirstLetterCaps, "tyh56gf"))
        switch response {
        case .success:
            break
        case .failure(_, let message):
            print(message.localized())
        }
only with two value validations
----------------------------------------------------------------------
    let response = Validation.shared.validate(values: (ValidationType.email, "hello@gmail.com"), (ValidationType.stringWithFirstLetterCaps, "tyh56gf"))
        switch response {
        case .success:
            break
        case .failure(_, let message):
            print(message.localized())
        }

    

