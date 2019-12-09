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
    var dataFromConstructor: [[Int]]
    
    func determinant() -> Int {
        return determinantRecursive(dataFromConstructor, dimension)
    }
    
    private func determinantRecursive(_ matrix: [[Int]], _ size: Int ) -> Int {
        var m, n, det, s: Int
        
        var tempMatrix = Array(repeating: Array(repeating: 0, count: size ), count: size)
        if size == 1 {return matrix[0][0]} else {
            det = 0
            s = 1
            for c in 0..<size {
                m = 0
                n = 0
                for i in 0..<size {
                    for j in 0..<size {
                        tempMatrix[i][j] = 0
                        if i != 0 && j != c {
                            tempMatrix[m][n] = matrix[i][j]
                            if n < (size - 2) {
                                n += 1
                            } else {
                                n = 0
                                m += 1
                            }
                        }
                    }
                }
                det = det + s * (matrix[0][c] * determinantRecursive(tempMatrix, size - 1))
                s = -s
            }
        }

        return det
    
    }
    
    required init(dimension: Int, elementConstructor: ((_ column: Int, _ row: Int) -> Int)) {
        self.dimension = dimension
        // создаëм матрицу под размерность
        var tempMatrix = Array(repeating: Array(repeating: 0, count: dimension), count: dimension)
        // заполняем матрицу через замыкание elementConstructor
        for column in 0..<tempMatrix.count {
            for row in 0..<tempMatrix[0].count {
                tempMatrix[column][row] = elementConstructor(column, row)
            }
        }

        self.dataFromConstructor = tempMatrix
    }

}

var matrix = Matrix(dimension: 3, elementConstructor: {column, row in return row + column + Int.random(in: 0..<10)})

matrix.dataFromConstructor
matrix.determinant








