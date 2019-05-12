dateFormat = {
    _fmt: {
        "yyyy": function (date) { return date.getFullYear() + ''; },
        "MM": function (date) { return ('0' + (date.getMonth() + 1)).slice(-2); },
        "dd": function (date) { return ('0' + date.getDate()).slice(-2); },
        "hh": function (date) { return ('0' + date.getHours()).slice(-2); },
        "mm": function (date) { return ('0' + date.getMinutes()).slice(-2); },
        "ss": function (date) { return ('0' + date.getSeconds()).slice(-2); }
    },
    _priority: ["yyyy", "MM", "dd", "hh", "mm", "ss"],
    format: function (date, format) {
        return this._priority.reduce((res, fmt) => res.replace(fmt, this._fmt[fmt](date)), format)
    }
};