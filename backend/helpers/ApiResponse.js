exports.successResponse = function (req, res, msg) {
    const data = {
      success: true,
      message: msg,
    };
    return res.status(200).json(data);
  };
  
  exports.successResponseWithData = function (req, res, msg, data) {
    const resData = {
      success: true,
      message: msg,
      data: data,
    };
    return res.status(200).json(resData);
  };
  
  exports.errorResponse = function (req, res, msg) {
    const data = {
      success: false,
      message: msg,
    };
    return res.status(400).json(data);
  };

  exports.errorResponseWithData = function (req, res, msg, data) {
    const resData = {
      success: false,
      message: msg,
      data: data,
    };
    return res.status(400).json(resData);
  };
  
  exports.notFoundResponse = function (req, res, msg) {
    const data = {
      success: false,
      message: msg,
    };
    return res.status(404).json(data);
  };
  
  exports.validationErrorWithData = function (req, res, msg, data) {
    let errorObject = {};
    data.forEach((error) => (errorObject[error.param] = error.msg));
    const resData = {
      success: false,
      message: msg,
      data: errorObject,
    };
    return res.status(400).json(resData);
  };
  
  exports.unauthorizedResponse = function (req, res, msg) {
    const data = {
      success: false,
      message: msg,
    };
    return res.status(401).json(data);
  };
  
  exports.forbiddenResponse = function (req, res, msg) {
    const data = {
      success: false,
      message: msg,
    };
    return res.status(403).json(data);
  };