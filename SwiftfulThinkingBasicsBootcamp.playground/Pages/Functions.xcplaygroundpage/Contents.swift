import Foundation

func myFirstFunction() {
    print("MY FIRST FUNCTION CALLED.")
}

func mySecondFunction() {
    myFirstFunction()
    print("MY SECOND FUNCTION CALLED.")
}

mySecondFunction()
