//: [Previous](@previous) / [Next](@next)
//: # Decoding an Image
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Decoding the text
 Now we will (at last!) decode the image.
 
 Recall, our rules are:
 
 * If a line starts with a 0, the first pixel is black.
 * If a line does not start with a 0, the first pixel is white.
 * When a comma is encountered, a new number begins, and the colour switches.
 * When a newline character is encountered, go to a new row in the image.
 * Once we have a new number, we draw that many pixels in the current colour.
 
 First, copy and paste your encoded image string to this page.
*/

// Copy your encoded image string here...
let encodedBitmap = """
w9b3w7
w7b2l1d2b2w6
w6b1l4d3b1w5
w5b1l6d3b1w4
w4b1l8d3b1w3
w3b1l9d4b1w2
w3b1l81l1d3b1w2
w2b1l1b4l5b4d1b1w1
w2b1l1b1w2b2l3b2w2b1d1b1w1
w2b1l1b1w1b4l1b4w1b1d1b1w1
w2b1l1b3w1b2l1b2w1b3d1b1w1
w3b1l1b5l1b5d1b1w2
w3b1l2b4l1b4d2b1w2
w4b1l8d3b1w3
w4b1l8d3b1w3
w5b1l6d3b1w4
w6b1l4d3b1w5
w4b2l1b2l1d2b2d1b2w3
w2b2l4d1b3d5b2w1
w1b1l7d3l1d6b1

"""

// Make a canvas
let canvas = Canvas(width: 402, height: 402)

// Make a grid
drawGrid(on: canvas)

// Start drawing at left
var x = 0

// Set the size of a "pixel"
let cellSize = 20

// Keep track of current colour
var currentColor = "white"

// Start drawing at top of grid
var y = canvas.height - cellSize - 2

// Store the current number of pixels to draw
var drawThisManyPixels = 0

// Iterate over each character in the encoded bitmap string
for character in encodedBitmap {
    
    // Print the current character so we can see what it is
    print("Current character is:")
    print(character)
    
    // Set colour at start of a line
    if character == "b" {
        
        canvas.fillColor = Color.black
        currentColor = "black"
        
    } else if character == "w" {
        
        canvas.fillColor = Color.white
        currentColor = "White"
        
    } else if character == "l" {
        
        canvas.fillColor = Color.init(hue: 120, saturation: 100, brightness: 100, alpha: 100)
        currentColor = "Light Green"
        
    } else if character == "d" {
        
        canvas.fillColor = Color.init(hue: 115, saturation: 100, brightness: 50, alpha: 100)
        currentColor = "Dark Green"

        
    } else if character == "\n" {
        
        // We are on a new line, so reduce the vertical position
        // and reset the horizontal position
        y = y - cellSize
        x = 0
        
        // Default colour after new line is white
        canvas.fillColor = Color.white
        currentColor = "white"
        
    } else {
        
        // Get the new number of pixels to draw
        drawThisManyPixels = Int(String(character))!
        
        // Draw the pixels
        for _ in 1...drawThisManyPixels {

            // Draw the enlarged "pixel"
            canvas.drawRectangle(bottomLeftX: x, bottomLeftY: y, width: cellSize, height: cellSize)
            
            // Increase x so that the next pixel is drawn to the right of this one
            x += cellSize

        }

    }
    
}

/*:
 ### Check the results
 Does the output match what you'd expect, based on the values in the encoded string?
 
 How do you know?
 
 Write your ideas in the code comment below.
 */

// I notice that...
// I know this because...

/*:
 ## Extension
 Now that you have an understanding of how if statements (also called *selection* statements or *conditional* statements) work... extend this code.
 
 How could you adjust the rules so that pixels can be rendered in colour?
 
 What additions or changes would you need to make to the code above?
 
 Work with a partner to discuss possibilities and then make the changes in code.
 */


/*:
 Now, **remember to commit and push your work**.
 */
/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView
