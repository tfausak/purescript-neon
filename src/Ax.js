'use strict';

// module Ax

module.exports = {
  jsAddArray: function (x) {
    return function (y) {
      return x.concat(y);
    };
  },
  jsAddInt: function (x) {
    return function (y) {
      return x + y;
    };
  },
  jsAddNumber: function (x) {
    return function (y) {
      return x + y;
    };
  },
  jsAddString: function (x) {
    return function (y) {
      return x + y;
    };
  },
  jsCompareArray: function (_) {
    return function (lessThan) {
      return function (equalTo) {
        return function (greaterThan) {
          return function (compare) {
            return function (x) {
              return function (y) {
                var i;
                var xl = x.length;
                var yl = y.length;
                for (i = 0; i < xl && i < yl; ++i) {
                  switch (compare(x[i])(y[i])) {
                    case lessThan:
                      return lessThan;
                    case greaterThan:
                      return greaterThan;
                  }
                }
                if (xl < yl) {
                  return lessThan;
                } else if (xl > yl) {
                  return greaterThan;
                } else {
                  return equalTo;
                }
              };
            };
          };
        };
      };
    };
  },
  jsCompareChar: function (lessThan) {
    return function (equalTo) {
      return function (greaterThan) {
        return function (x) {
          return function (y) {
            if (x < y) {
              return lessThan;
            } else if (x > y) {
              return greaterThan;
            } else {
              return equalTo;
            }
          };
        };
      };
    };
  },
  jsCompareInt: function (lessThan) {
    return function (equalTo) {
      return function (greaterThan) {
        return function (x) {
          return function (y) {
            if (x < y) {
              return lessThan;
            } else if (x > y) {
              return greaterThan;
            } else {
              return equalTo;
            }
          };
        };
      };
    };
  },
  jsCompareNumber: function (lessThan) {
    return function (equalTo) {
      return function (greaterThan) {
        return function (x) {
          return function (y) {
            if (x < y) {
              return lessThan;
            } else if (x > y) {
              return greaterThan;
            } else {
              return equalTo;
            }
          };
        };
      };
    };
  },
  jsCompareString: function (lessThan) {
    return function (equalTo) {
      return function (greaterThan) {
        return function (x) {
          return function (y) {
            if (x < y) {
              return lessThan;
            } else if (x > y) {
              return greaterThan;
            } else {
              return equalTo;
            }
          };
        };
      };
    };
  },
  jsDivideInt: function (x) {
    return function (y) {
      return (x / y) | 0;
    };
  },
  jsDivideNumber: function (x) {
    return function (y) {
      return x / y;
    };
  },
  jsEqualArray: function (x) {
    return function (y) {
      var i;
      if (xs.length === ys.length) {
        for (i = 0; i < xs.length; ++i) {
          if (xs[i] !== ys[i]) {
            return false;
          }
        }
        return true;
      } else {
        return false;
      }
    };
  },
  jsEqualBoolean: function (x) {
    return function (y) {
      return x === y;
    };
  },
  jsEqualChar: function (x) {
    return function (y) {
      return x === y;
    };
  },
  jsEqualInt: function (x) {
    return function (y) {
      return x === y;
    };
  },
  jsEqualNumber: function (x) {
    return function (y) {
      return x === y;
    };
  },
  jsEqualObject: function (x) {
    return function (y) {
      return x === y;
    };
  },
  jsEqualString: function (x) {
    return function (y) {
      return x === y;
    };
  },
  jsModuloInt: function (x) {
    return function (y) {
      return x % y;
    };
  },
  jsMultiplyInt: function (x) {
    return function (y) {
      return x * y;
    };
  },
  jsMultiplyNumber: function (x) {
    return function (y) {
      return x * y;
    };
  },
  jsSubtractInt: function (x) {
    return function (y) {
      return x - y;
    };
  },
  jsSubtractNumber: function (x) {
    return function (y) {
      return x - y;
    };
  },
  jsBottomChar: String.fromCharCode(0),
  jstopChar: String.fromCharCode(65535)
};
