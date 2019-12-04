protocol MatrixTestable {
    
    // Constructor
    // dimension: Matrix size
    // elementConstructor: Closure with input element row and column, which return the element Int value.
    init(dimension: Int, elementConstructor: ((_ column: Int, _ row: Int) -> Int))

    // Determinant calculating function
    func determinant() -> Int
    
}


struct Matrix: MatrixTestable {
    let dimension: Int
    
    func determinant() -> Int {
        return 2 //calculate determine
    }
    
    init(dimension: Int, elementConstructor: ((Int, Int) -> Int)) {
        self.dimension = dimension
    }
    
    func createMatrix() -> [[Int]]{
        return Array(repeating: Array(repeating: 0, count: dimension), count: dimension)
    }

}

var matrix = Matrix(dimension: 3, elementConstructor: ((Int, Int) -> Int))
var matrixData = matrix.createMatrix()
matrixData = [[0, 1, 2], [2, 3, 4], [4, 5, 6]]




//func determinant<T : SignedNumericArithmeticType>(matrix: Matrix<T>) -> T {
//assert(matrix.isSquare, "Cannot find the determinant of a non-square matrix")
//assert(!matrix.isEmpty, "Cannot find the determinant of an empty matrix")
//// Base case
//    if matrix.count == 1 { return matrix[0,0] }
//else {
//// Recursive case
//        var sum: T = 0
//var multiplier: T = 1
//let topRow = matrix.rows[0]
//for (column, num) in topRow.enumerate() {
//var subMatrix = matrix
//            subMatrix.removeRow(atIndex: 0)
//            subMatrix.removeColumn(atIndex: column)
//            sum += num * multiplier * determinant(subMatrix)
//            multiplier *= (0-1) // swift is buggy
//        }
//return sum
//    }
//}
