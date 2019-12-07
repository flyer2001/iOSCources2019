import Foundation

protocol MatrixTestable {
    
    // Constructor
    // dimension: Matrix size
    // elementConstructor: Closure with input element row and column, which return the element Int value.
    init(dimension: Int, elementConstructor: ((_ column: Int, _ row: Int) -> Int))

    // Determinant calculating function
    func determinant() -> Int
    
}


class Matrix: MatrixTestable {
    
    let dimension: Int
    var data: [[Int]]
    
    func determinant() -> Int {
        
        // здесь по идее надо считать с помощью рекурсии определитель матрицы, но не осилил
        func determinate (matrix: [[Int]], n: Int) -> Int {
        return matrix[0][0] * matrix [1][1] - matrix[0][1] * matrix[1][0]
        }
        
        if dimension != 2 {return 0}  // костыль))))
        return Int(determinate(matrix: data, n: dimension))
        
    }
    
    required init(dimension: Int, elementConstructor: ((Int, Int) -> Int)) {
        self.dimension = dimension
        self.data = Array(repeating: Array(repeating: 0, count: dimension), count: dimension)
    }

}

var matrix = Matrix(dimension: 2, elementConstructor: {row, column in return 2 * row + column})
matrix.data = [[0, 1], [5, 6]]
let determinant = matrix.determinant()
