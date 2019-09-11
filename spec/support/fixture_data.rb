module FixtureData
  class << self
    def rectangle_with_rectangle_center_holes
      {
        type: 'rectangle',
        title: 'Закладная 1',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 1,
        circle: {diameter: 300},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'rectangle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 40, y: 30, l: 50, angle: 0},
            width: 40,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'rectangle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 30, y: 30, l: 50, angle: 0},
            width: 40,
            height: 40,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'rectangle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 40, y: 30, l: 50, angle: 0},
            width: 20,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'rectangle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 40, y: 40, l: 50, angle: 0},
            width: 40,
            height: 60,
            diameter: 40,
            radius: 0
          }
        }
      }
    end

    def rectangle_with_rectangle_side_holes
      {
        type: 'rectangle',
        title: 'Закладная 1',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 1,
        circle: {diameter: 300},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'rectangle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 20, y: 20, l: 50, angle: 0},
            width: 40,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'rectangle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 10, y: 10, l: 50, angle: 0},
            width: 40,
            height: 40,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'rectangle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 30, y: 20, l: 50, angle: 0},
            width: 20,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'rectangle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 20, y: 10, l: 50, angle: 0},
            width: 40,
            height: 60,
            diameter: 40,
            radius: 0
          }
        }
      }
    end

    def rectangle_with_circle_center_holes
      {
        type: 'rectangle',
        title: 'Закладная 1',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 1,
        circle: {diameter: 300},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 40, y: 60, l: 50, angle: 0},
            width: 40,
            height: 20,
            diameter: 20,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 40, y: 40, l: 50, angle: 0},
            width: 40,
            height: 40,
            diameter: 20,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 50, y: 40, l: 50, angle: 0},
            width: 20,
            height: 20,
            diameter: 60,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 50, y: 60, l: 50, angle: 0},
            width: 40,
            height: 60,
            diameter: 40,
            radius: 0
          }
        }
      }
    end

    def rectangle_with_circle_side_holes
      {
        type: 'rectangle',
        title: 'Закладная 1',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 1,
        circle: {diameter: 300},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 30, y: 50, l: 50, angle: 0},
            width: 40,
            height: 20,
            diameter: 20,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 30, y: 30, l: 50, angle: 0},
            width: 40,
            height: 40,
            diameter: 20,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 20, y: 10, l: 50, angle: 0},
            width: 20,
            height: 20,
            diameter: 60,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 30, y: 40, l: 50, angle: 0},
            width: 40,
            height: 60,
            diameter: 40,
            radius: 0
          }
        }
      }
    end

    def circle_with_circle_holes_center_center1
      {
        type: 'circle',
        title: 'Закладная 21',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 2,
        circle: {diameter: 80},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 30, y: 50, l: 22.36, angle: 63.43},
            width: 40,
            height: 20,
            diameter: 30,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 30, y: 30, l: 28, angle: 135},
            width: 40,
            height: 40,
            diameter: 20,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 20, y: 10, l: 22, angle: 207},
            width: 20,
            height: 20,
            diameter: 20,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 30, y: 40, l: 25, angle: 307},
            width: 40,
            height: 60,
            diameter: 20,
            radius: 0
          }
        }
      }
    end

    def circle_with_circle_holes_center_center
      {
        type: 'circle',
        title: 'Закладная 2',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 2,
        circle: {diameter: 200},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 30, y: 50, l: 70, angle: 45},
            width: 40,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 30, y: 30, l: 70, angle: 135},
            width: 40,
            height: 40,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 20, y: 10, l: 70, angle: 225},
            width: 20,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 30, y: 40, l: 70, angle: 315},
            width: 40,
            height: 60,
            diameter: 40,
            radius: 0
          }
        }
      }
    end

    def circle_with_circle_holes_center_side
      {
        type: 'circle',
        title: 'Закладная 2',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 2,
        circle: {diameter: 200},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 30, y: 50, l: 50, angle: 45},
            width: 40,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 30, y: 30, l: 50, angle: 135},
            width: 40,
            height: 40,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 20, y: 10, l: 50, angle: 225},
            width: 20,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 30, y: 40, l: 50, angle: 315},
            width: 40,
            height: 60,
            diameter: 40,
            radius: 0
          }
        }
      }
    end

    def circle_with_circle_holes_side_center
      {
        type: 'circle',
        title: 'Закладная 2',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 2,
        circle: {diameter: 200},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'side', hole: 'center'}, x: 30, y: 50, l: 30, angle: 45},
            width: 40,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'side', hole: 'center'}, x: 30, y: 30, l: 30, angle: 135},
            width: 40,
            height: 40,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'side', hole: 'center'}, x: 20, y: 10, l: 30, angle: 225},
            width: 20,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'side', hole: 'center'}, x: 30, y: 40, l: 30, angle: 315},
            width: 40,
            height: 60,
            diameter: 40,
            radius: 0
          }
        }
      }
    end

    def circle_with_circle_holes_side_side
      {
        type: 'circle',
        title: 'Закладная 2',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 2,
        circle: {diameter: 200},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 300, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'side', hole: 'side'}, x: 30, y: 50, l: 10, angle: 45},
            width: 40,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'side', hole: 'side'}, x: 30, y: 30, l: 10, angle: 135},
            width: 40,
            height: 40,
            diameter: 40,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxcrBHvG': {
            id: '_sWwX1DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-left', triangle: 'bottom-left', circle: 'side', hole: 'side'}, x: 20, y: 10, l: 10, angle: 225},
            width: 20,
            height: 20,
            diameter: 40,
            radius: 0
          },
          '_kyrm2DoDRy8uIgxcrBHvG': {
            id: '_kyrm2DoDRy8uIgxcrBHvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'bottom-right', triangle: 'bottom-left', circle: 'side', hole: 'side'}, x: 30, y: 40, l: 10, angle: 315},
            width: 40,
            height: 60,
            diameter: 40,
            radius: 0
          }
        }
      }
    end

    def triangle_with_circle_holes
      {
        type: 'triangle',
        title: 'Закладная 3',
        cutType: 'Лазерная резка',
        material: 1,
        quantity: 3,
        circle: {diameter: 300},
        rectangle: {width: 200, height: 160, radius: 0},
        triangle: {side1: 100, side2: 300},
        holes: {
          '_3h4Q1HelIRIg2tai683XK': {
            id: '_3h4Q1HelIRIg2tai683XK',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-left', triangle: 'bottom-left', circle: 'center', hole: 'center'}, x: 25, y: 55, l: 50, angle: 0},
            width: 40,
            height: 20,
            diameter: 30,
            radius: 0
          },
          '_sWwX1DoDRy8uIgxBDBqvG': {
            id: '_sWwX1DoDRy8uIgxBDBqvG',
            type: 'circle',
            position: {zeroPoint: {rectangle: 'top-right', triangle: 'bottom-left', circle: 'center', hole: 'side'}, x: 70, y: 10, l: 50, angle: 0},
            width: 40,
            height: 40,
            diameter: 20,
            radius: 0
          }
        }
      }
    end
  end
end
