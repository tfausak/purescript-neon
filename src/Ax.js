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
  }
};
