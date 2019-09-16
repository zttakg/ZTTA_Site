function set_date() {
    let date = new Date();
    let aYear = date.getFullYear();
    let aMonth = date.getMonth() + 1;
    let aDay = date.getDate();
    let aHour = date.getHours();
    let aMinute = date.getMinutes();
    let aSec = date.getSeconds();
    return  'Деталь_' + aYear + formatDateTwoSign(aMonth) + formatDateTwoSign(aDay) + "_" +
        formatDateTwoSign(aHour) + formatDateTwoSign(aMinute) + formatDateTwoSign(aSec);
}

function formatDateTwoSign(value) {
    if (value < 10) {
        return "0" + value;
    } else {
        return value;
    }
}

webpackJsonp([1], {
    "+UIE": function (t, e, i) {
        "use strict";
        i.d(e, "f", function () {
            return s
        }), i.d(e, "e", function () {
            return n
        }), i.d(e, "a", function () {
            return a
        }), i.d(e, "g", function () {
            return o
        }), i.d(e, "l", function () {
            return r
        }), i.d(e, "m", function () {
            return l
        }), i.d(e, "d", function () {
            return c
        }), i.d(e, "k", function () {
            return u
        }), i.d(e, "c", function () {
            return h
        }), i.d(e, "b", function () {
            return d
        }), i.d(e, "h", function () {
            return p
        }), i.d(e, "p", function () {
            return m
        }), i.d(e, "i", function () {
            return f
        }), i.d(e, "q", function () {
            return _
        }), i.d(e, "n", function () {
            return v
        }), i.d(e, "o", function () {
            return g
        }), i.d(e, "j", function () {
            return b
        });
        var s = "HOLE_EDIT_OPEN",
            n = "HOLE_EDIT_CLOSE",
            a = "ADD_HOLE",
            o = "LOAD_SETTINGS",
            r = "SET_ERRORS",
            l = "SHOW_CRITICAL_ERROR",
            c = "CLEAR_VALIDATION_ERRORS",
            u = "SAVE_SHAPE",
            h = "CALCULATE_COST",
            d = "ADD_TO_CART",
            p = "LOAD_SHAPE",
            m = "UPDATE_SHAPE",
            f = "LOAD_SHAPE_ORDER",
            _ = "UPDATE_SHAPE_ORDER",
            v = "SHOW_FATAL_ERROR",
            g = "SHOW_RESPONCE_ERRORS",
            b = "RESET_SHAPE"
    },
    "1SJ1": function (t, e) {},
    "4Sls": function (t, e) {},
    "DP/h": function (t, e, i) {
        "use strict";
        var s = i("Dd8w"),
            n = i.n(s),
            a = i("NYxO"),
            o = i("+UIE"),
            r = i("ye7G"),
            l = i("Fmw6"),
            c = i("bOdI"),
            u = i.n(c),
            h = i("Gu7T"),
            d = i.n(h),
            p = {
                props: {
                    theme: {
                        type: [String, Array],
                        default: ""
                    },
                    baseClassName: {
                        type: String,
                        default: "component"
                    }
                },
                computed: {
                    themeClasses: function () {
                        var t = this,
                            e = function (e) {
                                return t.baseClassName + "_style_" + e
                            };
                        return Array.isArray(this.theme) ? this.theme.map(e) : this.theme.trim().split(" ").filter(function (t) {
                            return "" !== t
                        }).map(e)
                    }
                }
            },
            m = {
                name: "Button",
                mixins: [p],
                props: {
                    type: {
                        type: String,
                        default: "button"
                    },
                    color: String,
                    to: {
                        type: [String, Object],
                        default: null
                    },
                    size: {
                        type: String,
                        default: "medium"
                    },
                    theme: {
                        type: [String, Array],
                        default: ""
                    },
                    block: Boolean,
                    disabled: {
                        type: Boolean,
                        default: !1
                    },
                    icon: Boolean,
                    value: null,
                    baseClassName: {
                        type: String,
                        default: "button"
                    }
                },
                computed: {
                    classes: function () {
                        var t, e = [this.baseClassName, (t = {}, u()(t, this.baseClassName + "_color_" + this.color, this.color), u()(t, this.baseClassName + "_size_" + this.size, this.size), u()(t, this.baseClassName + "_block", this.block), u()(t, this.baseClassName + "_disabled", this.disabled), u()(t, this.baseClassName + "_icon", this.icon), t)].concat(d()(this.themeClasses));
                        return e
                    }
                },
                methods: {
                    handleClick: function (t) {
                        this.$emit("click", t)
                    }
                },
                render: function (t) {
                    var e = this.to ? "a" : "button",
                        i = this.to ? null : this.type;
                    return t(e, {
                        on: {
                            click: this.handleClick
                        },
                        class: this.classes,
                        attrs: {
                            type: i,
                            href: this.to,
                            disabled: !this.to && this.disabled
                        }
                    }, [this.$slots.default])
                }
            },
            f = i("K1/g"),
            _ = Object(f.a)(m, void 0, void 0, !1, null, null, null).exports,
            v = {
                methods: {
                    hasSlot: function () {
                        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "default";
                        return !!this.$slots[t]
                    }
                }
            },
            g = i("Qtl1"),
            b = {
                props: {
                    id: {
                        type: String,
                        default: void 0
                    },
                    baseClassName: {
                        type: String,
                        default: "checkbox"
                    }
                },
                computed: {
                    uniqId: function () {
                        return this.id || this.baseClassName + "-id-" + Object(g.a)()
                    }
                }
            },
            y = {
                name: "Checkbox",
                mixins: [v, b, p],
                model: {
                    prop: "model",
                    event: "change"
                },
                props: {
                    label: String,
                    model: {
                        type: [String, Array],
                        default: void 0
                    },
                    name: {
                        type: String,
                        default: null
                    },
                    value: {
                        type: [String, Boolean],
                        default: ""
                    },
                    className: {
                        type: String,
                        default: ""
                    },
                    theme: {
                        type: String,
                        default: "default"
                    },
                    required: {
                        type: Boolean,
                        default: !1
                    },
                    checked: {
                        type: Boolean,
                        default: !1
                    },
                    disabled: {
                        type: Boolean,
                        default: !1
                    },
                    labelHidden: {
                        type: Boolean,
                        default: !1
                    },
                    boxHelper: {
                        type: Boolean,
                        default: !0
                    },
                    baseClassName: {
                        type: String,
                        default: "checkbox"
                    }
                },
                computed: {
                    classes: function () {
                        return [this.baseClassName].concat(d()(this.themeClasses))
                    },
                    state: function () {
                        return void 0 === this.model ? this.checked : Array.isArray(this.model) ? -1 !== this.model.indexOf(this.value) : this.model
                    }
                },
                methods: {
                    onChange: function () {
                        this.toggle()
                    },
                    toggle: function () {
                        if (!this.disabled) {
                            var t = this.model;
                            if (Array.isArray(t)) {
                                var e = (t = t.slice()).indexOf(this.value); - 1 === e ? t.push(this.value) : t.splice(e, 1)
                            } else t = !this.state;
                            this.$emit("change", t)
                        }
                    }
                }
            },
            C = Object(f.a)(y, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("label", {
                    class: t.classes,
                    attrs: {
                        for: t.uniqId
                    }
                }, [i("input", {
                    class: ["form-control", "form-control_type_checkbox", this.baseClassName + "__control", t.className],
                    attrs: {
                        type: "checkbox",
                        id: t.uniqId,
                        name: t.name,
                        required: t.required,
                        disabled: t.disabled
                    },
                    domProps: {
                        value: t.value,
                        checked: t.state
                    },
                    on: {
                        change: t.onChange
                    }
                }), t._v(" "), t.boxHelper ? i("span", {
                    class: this.baseClassName + "__box"
                }) : t._e(), t._v(" "), t.label || t.hasSlot() ? i("span", {
                    class: [this.baseClassName + "__label", {
                        visuallyhidden: t.labelHidden
                    }]
                }, [t._v("\n    " + t._s(t.label) + "\n    "), t._t("default")], 2) : t._e()])
            }, [], !1, null, null, null).exports,
            S = {
                name: "Fieldset",
                props: {
                    legend: String
                },
                render: function (t) {
                    return t("fieldset", {
                        class: "fieldset"
                    }, [this.legend && t("legend", {
                        class: "fieldset__legend"
                    }, [this.legend]), this.$slots.default && this.$slots.default.map(function (e) {
                        return t("div", {
                            class: "fieldset__item"
                        }, [e])
                    })])
                }
            },
            k = Object(f.a)(S, void 0, void 0, !1, null, null, null).exports,
            w = {
                name: "Form",
                render: function (t) {
                    return t("form", {
                        class: "form"
                    }, [this.$slots.default])
                }
            },
            x = (Object(f.a)(w, void 0, void 0, !1, null, null, null).exports, {
                name: "FormItem",
                mixins: [p],
                props: {
                    label: String,
                    labelPosition: {
                        validator: {
                            enum: function () {
                                var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
                                return function (e) {
                                    return t.includes(e)
                                }
                            }
                        }.enum(["top", "left", "right"]),
                        default: "top"
                    },
                    htmlFor: String,
                    errors: {
                        type: Array,
                        default: function () {
                            return []
                        }
                    },
                    baseClassName: {
                        type: String,
                        default: "form-item"
                    }
                },
                computed: {
                    classes: function () {
                        var t = [this.baseClassName, u()({}, this.baseClassName + "_label_" + this.labelPosition, this.labelPosition)].concat(d()(this.themeClasses));
                        return t
                    }
                }
            }),
            O = Object(f.a)(x, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    class: t.classes
                }, [t.label ? i("div", {
                    class: t.baseClassName + "__label"
                }, [t.htmlFor ? i("label", {
                    staticClass: "label",
                    attrs: {
                        for: t.htmlFor
                    },
                    domProps: {
                        innerHTML: t._s(t.label)
                    }
                }) : i("span", {
                    staticClass: "label",
                    domProps: {
                        innerHTML: t._s(t.label)
                    }
                })]) : t._e(), t._v(" "), i("div", {
                    class: t.baseClassName + "__control"
                }, [t._t("default")], 2), t._v(" "), t.errors.length > 0 ? i("ul", {
                    class: t.baseClassName + "__errors"
                }, t._l(t.errors, function (e, s) {
                    return i("li", {
                        key: s
                    }, [t._v(t._s(e.message))])
                })) : t._e()])
            }, [], !1, null, null, null).exports,
            E = i("oiih"),
            I = {
                name: "Icon",
                props: {
                    name: String,
                    title: String
                },
                data: function () {
                    return {
                        spritePath: E.n
                    }
                }
            },
            T = Object(f.a)(I, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return t.name ? i("svg", {
                    class: ["icon", "icon_" + t.name],
                    attrs: {
                        role: "img"
                    }
                }, [t.title ? i("title", [t._v(t._s(t.title))]) : t._e(), t._v(" "), i("use", {
                    attrs: {
                        "xlink:href": t.spritePath + "#" + t.name
                    }
                })]) : t._e()
            }, [], !1, null, null, null).exports,
            H = {
                name: "MaterialIcon",
                props: {
                    name: String,
                    size: {
                        type: Number,
                        default: 24
                    }
                }
            },
            P = (i("qzXf"), Object(f.a)(H, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return this.name ? e("span", {
                    staticClass: "material-icon",
                    style: {
                        fontSize: this.size + "px"
                    }
                }, [this._v("\n  " + this._s(this.name) + "\n")]) : this._e()
            }, [], !1, null, "1d00f694", null).exports, {
                name: "Input",
                components: {
                    Icon: T
                },
                mixins: [p, b],
                props: {
                    value: {
                        type: [String, Number],
                        default: ""
                    },
                    name: String,
                    placeholder: String,
                    type: {
                        type: String,
                        default: "text"
                    },
                    theme: {
                        type: [String, Array],
                        default: "default"
                    },
                    block: Boolean,
                    icon: String,
                    min: Number,
                    max: Number,
                    step: String,
                    baseClassName: {
                        type: String,
                        default: "input"
                    }
                },
                computed: {
                    classes: function () {
                        var t;
                        return [this.baseClassName, (t = {}, u()(t, this.baseClassName + "_type_" + this.type, this.type), u()(t, this.baseClassName + "_icon", this.icon), u()(t, this.baseClassName + "_block", this.block), t)].concat(d()(this.themeClasses))
                    }
                },
                methods: {
                    onInput: function (t) {
                        this.$emit("input", t.target.value)
                    }
                }
            }),
            R = Object(f.a)(P, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("span", {
                    class: t.classes
                }, [t.icon ? i("span", {
                    class: t.baseClassName + "__icon"
                }, [i("Icon", {
                    attrs: {
                        name: t.icon
                    }
                })], 1) : t._e(), t._v(" "), i("input", {
                    class: ["form-control", "form-control_type_input", t.baseClassName + "__control"],
                    attrs: {
                        id: t.uniqId,
                        name: t.name,
                        type: t.type,
                        min: t.min,
                        max: t.max,
                        step: t.step,
                        placeholder: t.placeholder
                    },
                    domProps: {
                        value: t.value
                    },
                    on: {
                        input: t.onInput
                    }
                })])
            }, [], !1, null, null, null).exports,
            F = {
                name: "Radio",
                mixins: [v, b, p],
                model: {
                    prop: "model",
                    event: "change"
                },
                props: {
                    label: {
                        type: String,
                        default: ""
                    },
                    model: {
                        type: String,
                        default: void 0
                    },
                    name: {
                        type: String,
                        default: null
                    },
                    value: {
                        type: String,
                        default: ""
                    },
                    className: {
                        type: String,
                        default: ""
                    },
                    theme: {
                        type: String,
                        default: "default"
                    },
                    required: {
                        type: Boolean,
                        default: !1
                    },
                    checked: {
                        type: Boolean,
                        default: !1
                    },
                    disabled: {
                        type: Boolean,
                        default: !1
                    },
                    labelHidden: {
                        type: Boolean,
                        default: !1
                    },
                    boxHelper: {
                        type: Boolean,
                        default: !0
                    },
                    baseClassName: {
                        type: String,
                        default: "radio"
                    }
                },
                computed: {
                    classes: function () {
                        return [this.baseClassName].concat(d()(this.themeClasses))
                    },
                    state: function () {
                        return void 0 === this.model ? this.checked : this.model === this.value
                    }
                },
                methods: {
                    onChange: function () {
                        this.toggle()
                    },
                    toggle: function () {
                        this.disabled || this.$emit("change", this.state ? "" : this.value)
                    }
                }
            },
            N = Object(f.a)(F, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("label", {
                    class: t.classes,
                    attrs: {
                        for: t.uniqId
                    }
                }, [i("input", {
                    class: ["form-control", "form-control_type_radio", this.baseClassName + "__control", t.className],
                    attrs: {
                        type: "radio",
                        id: t.uniqId,
                        name: t.name,
                        required: t.required,
                        disabled: t.disabled
                    },
                    domProps: {
                        value: t.value,
                        checked: t.state
                    },
                    on: {
                        change: t.onChange
                    }
                }), t._v(" "), t.boxHelper ? i("span", {
                    class: this.baseClassName + "__box"
                }) : t._e(), t._v(" "), t.label || t.hasSlot() ? i("span", {
                    class: [this.baseClassName + "__label", {
                        visuallyhidden: t.labelHidden
                    }]
                }, [t.hasSlot() ? t._e() : [t._v(t._s(t.label))], t._v(" "), t._t("default")], 2) : t._e()])
            }, [], !1, null, null, null).exports,
            M = {
                name: "Switcher",
                components: {
                    Checkbox: C
                },
                props: {
                    value: Boolean,
                    activeText: String,
                    inactiveText: String
                },
                methods: {
                    onInput: function () {
                        var t = !this.value;
                        this.checked = t, this.$emit("input", t)
                    }
                }
            },
            $ = (Object(f.a)(M, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    class: ["switcher", t.value ? "switcher_on" : "switcher_off"]
                }, [t.inactiveText ? i("div", {
                    staticClass: "switcher__inactive-text"
                }, [t._v("\n    " + t._s(t.inactiveText) + "\n  ")]) : t._e(), t._v(" "), i("Checkbox", {
                    staticClass: "checkbox_type_toggle-sw",
                    attrs: {
                        value: t.value,
                        checked: t.value
                    },
                    on: {
                        input: t.onInput
                    }
                }), t._v(" "), t.activeText ? i("div", {
                    staticClass: "switcher__active-text"
                }, [t._v("\n    " + t._s(t.activeText) + "\n  ")]) : t._e()], 1)
            }, [], !1, null, null, null).exports, {
                name: "Select",
                mixins: [p, b],
                props: {
                    value: {
                        default: ""
                    },
                    name: String,
                    theme: {
                        type: String,
                        default: "default"
                    },
                    options: {
                        type: Array,
                        default: function () {
                            return []
                        }
                    },
                    placeholder: String,
                    disabled: Boolean,
                    multiple: {
                        type: Boolean,
                        default: !1
                    },
                    block: Boolean,
                    baseClassName: {
                        type: String,
                        default: "select"
                    },
                    resetOnOptionsChange: {
                        type: Boolean,
                        default: !1
                    }
                },
                data: function () {
                    return {
                        mutableValue: this.value,
                        mutableOptions: []
                    }
                },
                computed: {
                    classes: function () {
                        var t;
                        return [this.baseClassName, (t = {}, u()(t, this.baseClassName + "_type_" + this.type, this.type), u()(t, this.baseClassName + "_block", this.block), u()(t, this.baseClassName + "_inline", !this.block), t)].concat(d()(this.themeClasses))
                    },
                    hasOptions: function () {
                        return this.options.length > 0
                    }
                },
                watch: {
                    value: function (t) {
                        this.mutableValue = t
                    },
                    mutableValue: function () {
                        this.$emit("input", this.mutableValue)
                    },
                    options: function (t) {
                        this.mutableOptions = t
                    },
                    mutableOptions: function () {
                        this.resetOnOptionsChange && (this.mutableValue = this.multiple ? [] : "")
                    }
                },
                methods: {
                    getSelectedValue: function (t) {
                        return t.filter(function (t) {
                            return t.selected
                        }).map(function (t) {
                            return "_value" in t ? t._value : t.value
                        })
                    },
                    onChange: function (t) {
                        var e = this,
                            i = t.target,
                            s = [].slice.call(i.options),
                            n = this.getSelectedValue(s);
                        this.mutableValue = i.multiple ? n : n[0], this.$nextTick(function () {
                            e.$emit("change", e.mutableValue)
                        })
                    }
                }
            }),
            j = Object(f.a)($, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("span", {
                    class: t.classes
                }, [i("select", {
                    class: ["form-control", "form-control_type_select", t.baseClassName + "__control"],
                    attrs: {
                        id: t.uniqId,
                        name: t.name,
                        multiple: t.multiple,
                        disabled: t.disabled
                    },
                    domProps: {
                        value: t.mutableValue
                    },
                    on: {
                        change: t.onChange
                    }
                }, [t.placeholder ? i("option", {
                    class: t.baseClassName + "__placeholder",
                    attrs: {
                        value: "",
                        disabled: ""
                    },
                    domProps: {
                        selected: "" === t.mutableValue && "selected"
                    }
                }, [t._v("\n      " + t._s(t.placeholder) + "\n    ")]) : t._e(), t._v(" "), t._l(t.options, function (e) {
                    return t.hasOptions ? i("option", {
                        key: e.value,
                        attrs: {
                            label: e.label,
                            disabled: e.disabled,
                            hidden: e.hidden
                        },
                        domProps: {
                            value: e.value,
                            selected: e.value.toString() === t.mutableValue.toString() && "selected"
                        }
                    }, [t._v("\n      " + t._s(e.label) + "\n    ")]) : t._e()
                }), t._v(" "), t.hasOptions ? t._e() : t._t("default")], 2)])
            }, [], !1, null, null, null).exports,
            A = {
                name: "ButtonGroup",
                props: {
                    baseClassName: {
                        type: String,
                        default: "button-group"
                    }
                },
                render: function (t) {
                    return t("div", {
                        class: this.baseClassName
                    }, [this.$slots.default && this.$slots.default.map(function (t) {
                        var e = t;
                        return e.data.class = {}, e.data.class["button-group__item"] = !0, e
                    })])
                }
            },
            L = (Object(f.a)(A, void 0, void 0, !1, null, null, null).exports, {
                name: "InputGroup",
                props: {
                    theme: String,
                    baseClass: {
                        type: String,
                        default: "input-group"
                    }
                },
                computed: {
                    classNames: function () {
                        var t = this,
                            e = this.theme ? this.theme.split(" ").filter(function (t) {
                                return "" !== t
                            }).map(function (e) {
                                return t.baseClass + "_theme_" + e
                            }) : [];
                        return [this.baseClass].concat(d()(e))
                    }
                },
                render: function (t) {
                    var e = this;
                    return t("div", {
                        class: this.classNames
                    }, [this.$slots.default && this.$slots.default.map(function (t) {
                        var i = t;
                        return i.data.class = {}, i.data.class[e.baseClass + "__item"] = !0, i
                    })])
                }
            }),
            B = Object(f.a)(L, void 0, void 0, !1, null, null, null).exports,
            D = {
                name: "Dialog",
                components: {
                    Button: _,
                    Icon: T,
                    Modal: l.Modal
                },
                mixins: [p],
                props: {
                    name: {
                        type: String,
                        default: "dialog"
                    },
                    theme: String,
                    title: String,
                    close: Function,
                    baseClassName: {
                        type: String,
                        default: "dialog"
                    }
                },
                computed: {
                    classes: function () {
                        var t = this,
                            e = this.theme ? this.theme.split(" ").filter(function (t) {
                                return "" !== t
                            }).map(function (e) {
                                return t.baseClassName + "_theme_" + e
                            }) : [];
                        return [this.baseClassName].concat(d()(e))
                    }
                }
            },
            W = Object(f.a)(D, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    class: t.classes,
                    attrs: {
                        id: t.name,
                        role: "dialog",
                        "aria-modal": "true",
                        "aria-labelledby": t.name + "-dialog__title"
                    }
                }, [t.title || t.close ? i("header", {
                    staticClass: "dialog__header"
                }, [i("h2", {
                    class: t.baseClassName + "__title",
                    attrs: {
                        id: t.name + "-dialog__title"
                    }
                }, [t._v("\n      " + t._s(t.title) + "\n    ")]), t._v(" "), t.close ? i("Button", {
                    class: t.baseClassName + "__close",
                    on: {
                        click: t.close
                    }
                }, [i("Icon", {
                    attrs: {
                        name: "close"
                    }
                }), t._v(" "), i("span", {
                    staticClass: "visuallyhidden"
                }, [t._v("Close this dialog window")])], 1) : t._e()], 1) : t._e(), t._v(" "), i("main", {
                    class: t.baseClassName + "__content"
                }, [t._t("default")], 2), t._v(" "), i("footer", {
                    class: t.baseClassName + "__footer"
                }, [t._t("footer")], 2)])
            }, [], !1, null, null, null).exports,
            z = {
                name: "Tooltip",
                props: {
                    open: {
                        type: Boolean,
                        default: !1
                    },
                    arrow: {
                        type: Boolean,
                        default: !0
                    },
                    theme: String
                },
                computed: {
                    classes: function () {
                        var t = this.theme ? this.theme.split(" ").filter(function (t) {
                                return "" !== t
                            }).map(function (t) {
                                return "tooltip_theme_" + t
                            }) : [],
                            e = ["tooltip"].concat(d()(t));
                        return e
                    }
                }
            },
            q = (i("kk1Z"), Object(f.a)(z, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("transition", {
                    attrs: {
                        name: "tooltip"
                    }
                }, [this.open ? e("div", {
                    class: this.classes
                }, [this.arrow ? e("div", {
                    staticClass: "tooltip__arrow"
                }) : this._e(), this._v(" "), this._t("default")], 2) : this._e()])
            }, [], !1, null, "4ecc16dd", null).exports),
            V = i("Zrlr"),
            Z = i.n(V),
            U = i("wxAW"),
            X = i.n(U),
            Y = i("c/Tr"),
            G = i.n(Y);

        function J(t) {
            return {
                x: t.pageX,
                y: t.pageY
            }
        }

        function Q(t, e) {
            var i = Math.abs(e.x - t.x),
                s = Math.abs(e.y - t.y);
            return Math.sqrt(i * i + s * s)
        }

        function K(t, e) {
            return {
                x: (t.x + e.x) / 2,
                y: (t.y + e.y) / 2
            }
        }

        function tt(t) {
            return t.touches ? G()(t.touches).map(function (t) {
                return J(t)
            }) : [J(t)]
        }
        var et = function () {
                function t(e) {
                    var i = this,
                        s = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = s.eventArea,
                        a = void 0 === n ? e : n,
                        o = s.shouldCaptureFunc,
                        r = void 0 === o ? function () {
                            return !0
                        } : o;
                    Z()(this, t), this.target = e, this.shouldCaptureFunc = r, this.dx = 0, this.dy = 0, this.scale = 1, this.active = 0, this.lastPoints = [], ["onPointerDown", "onPointerMove", "onPointerUp"].forEach(function (t) {
                        i[t] = i[t].bind(i)
                    }), a.addEventListener("mousedown", this.onPointerDown), a.addEventListener("touchstart", this.onPointerDown), a.addEventListener("wheel", function (t) {
                        return i.onWheel(t)
                    })
                }
                return X()(t, [{
                    key: "reset",
                    value: function () {
                        this.dx = 0, this.dy = 0, this.scale = 1, this.update()
                    }
                }, {
                    key: "onWheel",
                    value: function (t) {
                        if (this.shouldCaptureFunc(t.target)) {
                            t.preventDefault();
                            var e = this.target.getBoundingClientRect(),
                                i = t.deltaY;
                            1 === t.deltaMode && (i *= 15);
                            var s = (i = Math.max(Math.min(i, 60), -60)) / 300 + 1;
                            this.scale * s < .05 || (this.scale *= s, this.dx -= (t.pageX - e.left) * (s - 1), this.dy -= (t.pageY - e.top) * (s - 1), this.update())
                        }
                    }
                }, {
                    key: "onFirstPointerDown",
                    value: function () {
                        document.addEventListener("mousemove", this.onPointerMove), document.addEventListener("mouseup", this.onPointerUp), document.addEventListener("touchmove", this.onPointerMove), document.addEventListener("touchend", this.onPointerUp)
                    }
                }, {
                    key: "onPointerDown",
                    value: function (t) {
                        "mousedown" === t.type && 1 !== t.which || this.shouldCaptureFunc(t.target) && (t.preventDefault(), this.lastPoints = tt(t), this.active = this.active + 1, 1 === this.active && this.onFirstPointerDown(t))
                    }
                }, {
                    key: "onPointerMove",
                    value: function (t) {
                        t.preventDefault();
                        var e = tt(t),
                            i = e.reduce(K),
                            s = this.lastPoints.reduce(K),
                            n = this.target.getBoundingClientRect();
                        if (this.dx += i.x - s.x, this.dy += i.y - s.y, e[1]) {
                            var a = Q(e[0], e[1]) / Q(this.lastPoints[0], this.lastPoints[1]);
                            this.scale *= a, this.dx -= (i.x - n.left) * (a - 1), this.dy -= (i.y - n.top) * (a - 1)
                        }
                        this.update(), this.lastPoints = e
                    }
                }, {
                    key: "update",
                    value: function () {
                        var t = "translate3d(" + this.dx + "px, " + this.dy + "px, 0) scale(" + this.scale + ")";
                        this.target.style.WebkitTransform = t, this.target.style.transform = t
                    }
                }, {
                    key: "onPointerUp",
                    value: function (t) {
                        t.preventDefault(), this.active = this.active - 1, this.lastPoints.pop(), this.active ? this.lastPoints = tt(t) : (document.removeEventListener("mousemove", this.onPointerMove), document.removeEventListener("mouseup", this.onPointerUp), document.removeEventListener("touchmove", this.onPointerMove), document.removeEventListener("touchend", this.onPointerUp))
                    }
                }]), t
            }(),
            it = {
                name: "SVGPanZoom",
                components: {
                    Button: _,
                    Icon: T
                },
                data: function () {
                    return {
                        panZoom: null
                    }
                },
                watch: {
                    $route: function (t, e) {
                        t.params.id && e.params.id !== t.params.id && this.initPanZoom()
                    }
                },
                mounted: function () {
                    var t = this;
                    this.$nextTick(function () {
                        t.initPanZoom()
                    })
                },
                updated: function () {
                    this.initPanZoom()
                },
                methods: {
                    initPanZoom: function () {
                        var t = this.$slots.default[0].elm,
                            e = this.$refs.svgPanZoomContainer;
                        t && (this.panZoom = new et(t, {
                            eventArea: e
                        }))
                    },
                    handleReset: function () {
                        this.panZoom.reset()
                    }
                }
            },
            st = (i("RmpG"), Object(f.a)(it, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    ref: "svgPanZoomContainer",
                    staticClass: "svg-pan-zoom grabbable"
                }, [this._t("default"), this._v(" "), e("Button", {
                    staticClass: "svg-pan-zoom__reset",
                    attrs: {
                        color: "gray",
                        theme: "solid",
                        title: "Центрировать деталь"
                    },
                    on: {
                        click: this.handleReset
                    }
                }, [e("Icon", {
                    attrs: {
                        name: "reset",
                        title: "Центрировать деталь"
                    }
                })], 1)], 2)
            }, [], !1, null, null, null).exports),
            nt = {
                name: "Spinner",
                mixins: [p],
                props: {
                    size: {
                        type: String,
                        default: "medium"
                    },
                    color: {
                        type: String,
                        default: "blue"
                    },
                    theme: {
                        type: [String, Array],
                        default: "1"
                    },
                    baseClassName: {
                        type: String,
                        default: "spinner"
                    }
                },
                computed: {
                    classes: function () {
                        var t;
                        return [this.baseClassName, (t = {}, u()(t, this.baseClassName + "_color_" + this.color, this.color), u()(t, this.baseClassName + "_size_" + this.size, this.size), t)].concat(d()(this.themeClasses))
                    }
                }
            },
            at = (i("zgxX"), Object(f.a)(nt, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    class: this.classes
                }, [e("span", {
                    staticClass: "visuallyhidden"
                }, [this._v("Loading...")])])
            }, [], !1, null, null, null).exports, {
                name: "SvgRoot",
                props: {
                    width: {
                        type: Number,
                        default: 500
                    },
                    height: {
                        type: Number,
                        default: 500
                    },
                    viewBox: {
                        type: String,
                        default: function () {
                            return "0 0 " + this.width + " " + this.height
                        }
                    }
                }
            }),
            ot = Object(f.a)(at, function () {
                var t = this.$createElement;
                return (this._self._c || t)("svg", {
                    attrs: {
                        width: this.width,
                        height: this.height,
                        viewBox: this.viewBox,
                        xmlns: "http://www.w3.org/2000/svg",
                        version: "1.1",
                        "xmlns:xlink": "http://www.w3.org/1999/xlink"
                    }
                }, [this._t("default")], 2)
            }, [], !1, null, null, null).exports,
            rt = {
                name: "SvgRectangle",
                props: {
                    width: {
                        type: String,
                        default: "300"
                    },
                    height: {
                        type: String,
                        default: "300"
                    },
                    rx: String,
                    ry: String,
                    x: {
                        type: String,
                        default: "0"
                    },
                    y: {
                        type: String,
                        default: "0"
                    },
                    radius: String,
                    strokeWidth: {
                        type: Number,
                        default: 0
                    },
                    strokeColor: String,
                    fillColor: String
                },
                computed: {
                    radiusX: function () {
                        var t = this.rx && this.ry ? this.rx : this.radius;
                        return t > 0 ? t : void 0
                    },
                    radiusY: function () {
                        var t = this.ry && this.ry ? this.ry : this.radius;
                        return t > 0 ? t : void 0
                    },
                    positionX: function () {
                        var t = this.x ? this.strokeWidth + parseInt(this.x, 10) : this.strokeWidth;
                        return t > 0 ? t : void 0
                    },
                    positionY: function () {
                        var t = this.y ? this.strokeWidth + parseInt(this.y, 10) : this.strokeWidth;
                        return t > 0 ? t : void 0
                    },
                    stroke: function () {
                        return parseInt(this.strokeWidth, 10) > 0 ? this.strokeWidth : void 0
                    }
                }
            },
            lt = Object(f.a)(rt, function () {
                var t = this,
                    e = t.$createElement;
                return (t._self._c || e)("rect", {
                    attrs: {
                        x: t.positionX,
                        y: t.positionY,
                        rx: t.radiusX,
                        ry: t.radiusY,
                        width: t.width,
                        height: t.height,
                        fill: t.fillColor,
                        "stroke-width": t.stroke,
                        stroke: t.strokeColor
                    }
                })
            }, [], !1, null, null, null).exports,
            ct = {
                name: "SvgCircle",
                props: {
                    diameter: {
                        type: String,
                        default: "300"
                    },
                    cx: String,
                    cy: String,
                    strokeWidth: Number,
                    strokeColor: String,
                    fillColor: String
                },
                computed: {
                    radius: function () {
                        return parseInt(this.diameter, 10) / 2
                    },
                    centerX: function () {
                        return this.getCenter(this.cx)
                    },
                    centerY: function () {
                        return this.getCenter(this.cy)
                    }
                },
                methods: {
                    getCenter: function (t) {
                        var e = t ? parseInt(this.radius, 10) + parseInt(t, 10) : this.radius;
                        return this.strokeWidth ? e + parseInt(this.strokeWidth, 10) : e
                    }
                }
            },
            ut = Object(f.a)(ct, function () {
                var t = this.$createElement;
                return (this._self._c || t)("circle", {
                    attrs: {
                        cx: this.centerX,
                        cy: this.centerY,
                        r: this.radius,
                        fill: this.fillColor,
                        "stroke-width": this.strokeWidth,
                        stroke: this.strokeColor
                    }
                })
            }, [], !1, null, null, null).exports,
            ht = {
                name: "SvgPolygon",
                props: {
                    points: String,
                    strokeWidth: Number,
                    strokeColor: String,
                    fillColor: String
                }
            },
            dt = Object(f.a)(ht, function () {
                var t = this.$createElement;
                return (this._self._c || t)("polygon", {
                    attrs: {
                        points: this.points,
                        x: this.strokeWidth,
                        y: this.strokeWidth,
                        fill: this.fillColor,
                        "stroke-width": this.strokeWidth,
                        stroke: this.strokeColor
                    }
                })
            }, [], !1, null, null, null).exports,
            pt = {
                name: "SvgTriangle",
                components: {
                    SvgPolygon: dt
                },
                props: {
                    side1: {
                        type: String,
                        default: "300"
                    },
                    side2: {
                        type: String,
                        default: "300"
                    },
                    fillColor: String
                },
                computed: {
                    points: function () {
                        return "0,0 0," + this.side1 + " " + this.side2 + "," + this.side1 + " 0,0"
                    }
                }
            },
            mt = Object(f.a)(pt, function () {
                var t = this.$createElement;
                return (this._self._c || t)("SvgPolygon", {
                    attrs: {
                        points: this.points,
                        fillColor: this.fillColor
                    }
                })
            }, [], !1, null, null, null).exports,
            ft = {
                name: "SvgLine",
                props: {
                    from: {
                        type: Array,
                        default: function () {
                            return [20, 120]
                        }
                    },
                    to: {
                        type: Array,
                        default: function () {
                            return [120, 20]
                        }
                    },
                    strokeWidth: {
                        type: Number,
                        default: 1
                    },
                    strokeLinecap: {
                        type: String,
                        default: "round"
                    },
                    strokeColor: {
                        type: String,
                        default: "#000"
                    }
                },
                computed: {
                    x1: function () {
                        return this.from[0]
                    },
                    y1: function () {
                        return this.from[1]
                    },
                    x2: function () {
                        return this.to[0]
                    },
                    y2: function () {
                        return this.to[1]
                    }
                }
            },
            _t = Object(f.a)(ft, function () {
                var t = this.$createElement;
                return (this._self._c || t)("line", {
                    attrs: {
                        x1: this.x1,
                        y1: this.y1,
                        x2: this.x2,
                        y2: this.y2,
                        "stroke-linecap": this.strokeLinecap,
                        "stroke-width": this.strokeWidth,
                        stroke: this.strokeColor
                    }
                })
            }, [], !1, null, null, null).exports,
            vt = {
                name: "SvgPath",
                props: {
                    path: {
                        type: String,
                        default: "M 100 300 L 150 350 L 100 400 L 50 350 L 100 300"
                    },
                    strokeWidth: Number,
                    strokeLinecap: String,
                    strokeColor: String,
                    fillColor: String
                }
            },
            gt = (Object(f.a)(vt, function () {
                var t = this.$createElement;
                return (this._self._c || t)("path", {
                    attrs: {
                        d: this.path,
                        "stroke-linecap": this.strokeLinecap,
                        "stroke-width": this.strokeWidth,
                        stroke: this.strokeColor,
                        fill: this.fillColor
                    }
                })
            }, [], !1, null, null, null).exports, i("d7EF")),
            bt = i.n(gt),
            yt = {
                name: "SvgArrow",
                components: {
                    SvgPolygon: dt,
                    SvgLine: _t,
                    SvgText: kt
                },
                props: {
                    orientation: {
                        type: String,
                        default: "horizontal"
                    },
                    width: {
                        type: String,
                        default: "300"
                    },
                    height: {
                        type: String,
                        default: "300"
                    },
                    color: {
                        type: String,
                        default: "#000"
                    }
                },
                computed: {
                    points: function () {
                        return E.b.map(function (t) {
                            return t.join(" ")
                        }).join(", ")
                    },
                    arrows: function () {
                        var t = parseInt(this.width, 10),
                            e = parseInt(this.height, 10),
                            i = E.e,
                            s = E.a,
                            n = {
                                horizontal: [{
                                    name: "right",
                                    move: [t - s, e + i - s / 2],
                                    angle: "90"
                                }, {
                                    name: "left",
                                    move: [1, e + i - s / 2],
                                    angle: "270"
                                }],
                                vertical: [{
                                    name: "up",
                                    move: [t + i - s / 2, 1],
                                    angle: "0"
                                }, {
                                    name: "down",
                                    move: [t + i - s / 2, e - s],
                                    angle: "180"
                                }]
                            };
                        return n[this.orientation]
                    },
                    line: function () {
                        var t = parseInt(this.width, 10),
                            e = parseInt(this.height, 10),
                            i = E.e,
                            s = {
                                horizontal: {
                                    from: [0, e + i],
                                    to: [t, e + i]
                                },
                                vertical: {
                                    from: [t + i, 0],
                                    to: [t + i, e]
                                }
                            };
                        return s[this.orientation]
                    }
                },
                methods: {
                    arrowStyle: function (t) {
                        var e = t.angle,
                            i = bt()(t.move, 2);
                        return "\n        transform: translate(" + i[0] + "px, " + i[1] + "px) rotate(" + e + "deg);\n        transform-origin: " + E.a / 2 + "px " + E.a / 2 + "px;\n        fill: " + this.color + ";\n      "
                    }
                }
            },
            Ct = Object(f.a)(yt, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("g", {
                    attrs: {
                        "data-name": "arrow"
                    }
                }, [t._l(t.arrows, function (e, s) {
                    return i("SvgPolygon", {
                        key: s,
                        style: t.arrowStyle(e),
                        attrs: {
                            "data-name": "arrow__" + e.name,
                            points: t.points
                        }
                    })
                }), t._v(" "), i("SvgLine", {
                    attrs: {
                        "data-name": "arrow__line",
                        from: t.line.from,
                        to: t.line.to,
                        strokeColor: t.color,
                        "stroke-linecap": "square",
                        "shape-rendering": "crispEdges"
                    }
                })], 2)
            }, [], !1, null, null, null).exports,
            St = {
                name: "SvgText"
            },
            kt = Object(f.a)(St, function () {
                var t = this.$createElement;
                return (this._self._c || t)("text", [this._t("default")], 2)
            }, [], !1, null, null, null).exports,
            wt = {
                name: "DimensionLine",
                components: {
                    SvgLine: _t,
                    SvgArrow: Ct,
                    SvgText: kt
                },
                props: {
                    orientation: {
                        type: String,
                        default: "horizontal"
                    },
                    width: {
                        type: String,
                        default: "300"
                    },
                    height: {
                        type: String,
                        default: "300"
                    },
                    diameter: {
                        type: String,
                        default: "300"
                    },
                    side1: {
                        type: String,
                        default: "300"
                    },
                    side2: {
                        type: String,
                        default: "300"
                    },
                    type: {
                        type: String,
                        default: "rectangle"
                    },
                    radius: {
                        type: String,
                        default: "0"
                    }
                },
                data: function () {
                    return {
                        lineColor: E.d,
                        textStyle: E.f
                    }
                },
                computed: {
                    arrowSize: function () {
                        switch (this.type) {
                            case "rectangle":
                                return {
                                    width: this.width,
                                    height: this.height
                                };
                            case "circle":
                                return {
                                    width: this.diameter,
                                    height: this.diameter
                                };
                            case "triangle":
                                return {
                                    width: this.side2,
                                    height: this.side1
                                };
                            default:
                                return {
                                    width: 0,
                                    height: 0
                                }
                        }
                    },
                    lines: function () {
                        var t = parseInt(this.width, 10),
                            e = parseInt(this.height, 10),
                            i = parseInt(this.radius, 10),
                            s = parseInt(this.diameter, 10),
                            n = parseInt(this.side1, 10),
                            a = parseInt(this.side2, 10),
                            o = E.e,
                            r = {
                                rectangle: {
                                    horizontal: [{
                                        from: [1, e + 1 - i],
                                        to: [1, e + o + 1],
                                        name: "left"
                                    }, {
                                        from: [t + 1, e + 1 - i],
                                        to: [t + 1, e + o + 1],
                                        name: "right"
                                    }],
                                    vertical: [{
                                        from: [t + 1 - i, 1],
                                        to: [t + o + 1, 1],
                                        name: "top"
                                    }, {
                                        from: [t + 1 - i, e + 1],
                                        to: [t + o, e + 1],
                                        name: "bottom"
                                    }]
                                },
                                circle: {
                                    horizontal: [{
                                        from: [1, s / 2],
                                        to: [1, s + o],
                                        name: "left"
                                    }, {
                                        from: [s + 1, s / 2],
                                        to: [s + 1, s + o],
                                        name: "right"
                                    }],
                                    vertical: [{
                                        from: [s / 2, 1],
                                        to: [s + o, 1],
                                        name: "top"
                                    }, {
                                        from: [s / 2, s + 2],
                                        to: [s + o, s + 1],
                                        name: "bottom"
                                    }]
                                },
                                triangle: {
                                    horizontal: [{
                                        from: [1, n + 1],
                                        to: [1, n + o + 1],
                                        name: "left"
                                    }, {
                                        from: [a, n + 1],
                                        to: [a, n + o + 1],
                                        name: "right"
                                    }],
                                    vertical: [{
                                        from: [1, 1],
                                        to: [a + o + 1, 1],
                                        name: "top"
                                    }, {
                                        from: [a, n + 1],
                                        to: [a + o, n + 1],
                                        name: "bottom"
                                    }]
                                }
                            };
                        return r[this.type][this.orientation]
                    },
                    text: function () {
                        var t = parseFloat(this.width, 10),
                            e = parseFloat(this.height, 10),
                            i = parseFloat(this.diameter, 10),
                            s = parseFloat(this.side1, 10),
                            n = parseFloat(this.side2, 10),
                            a = E.e,
                            o = 15;

                        function r(t) {
                            var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t;
                            return {
                                horizontal: {
                                    title: t.toString() + " мм",
                                    position: [t / 2, e + a - o],
                                    rotate: 0
                                },
                                vertical: {
                                    title: e.toString() + " мм",
                                    position: [-e / 2, t + a - o],
                                    rotate: -90
                                }
                            }
                        }
                        var l = {
                            rectangle: r(t, e),
                            circle: r(i),
                            triangle: r(n, s)
                        };
                        return l[this.type][this.orientation]
                    },
                    transform: function () {
                        return "horizontal" === this.orientation ? "translate(0, -8)" : "translate(-8, 0)"
                    }
                }
            },
            xt = Object(f.a)(wt, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("g", {
                    attrs: {
                        "data-name": "dimension-line dimension-line_" + t.orientation
                    }
                }, [t._l(t.lines, function (e, s) {
                    return i("SvgLine", {
                        key: s,
                        attrs: {
                            "data-name": "dimension-line__" + e.name,
                            from: e.from,
                            to: e.to,
                            strokeColor: t.lineColor,
                            "stroke-linecap": "square",
                            "shape-rendering": "crispEdges",
                            "stroke-dasharray": "3,3"
                        }
                    })
                }), t._v(" "), i("SvgArrow", {
                    attrs: {
                        orientation: t.orientation,
                        width: t.arrowSize.width,
                        height: t.arrowSize.height,
                        transform: t.transform,
                        color: t.lineColor
                    }
                }), t._v(" "), i("SvgText", {
                    style: t.textStyle,
                    attrs: {
                        "data-name": "dimension-line__text",
                        dx: t.text.position[0],
                        dy: t.text.position[1],
                        transform: "rotate(" + t.text.rotate + ")",
                        "text-anchor": "middle"
                    }
                }, [t._v("\n    " + t._s(t.text.title) + "\n  ")])], 2)
            }, [], !1, null, null, null).exports,
            Ot = Object(r.a)({
                getterType: "shape/getField",
                mutationType: "shape/updateField"
            }).mapFields,
            Et = {
                name: "ConstructorRectangle",
                components: {
                    Input: R,
                    FormItem: O
                },
                computed: n()({}, Ot({
                    width: "rectangle.width",
                    height: "rectangle.height",
                    radius: "rectangle.radius"
                }), Object(a.c)({
                    limits: "materialLimits"
                }), Object(a.e)({
                    validation: function (t) {
                        return t.errors.validation
                    }
                }), {
                    radiusMax: function () {
                        return Math.ceil(this.width / 2)
                    }
                })
            },
            It = Object(f.a)(Et, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    staticClass: "rectangle"
                }, [i("div", {
                    staticClass: "form__item input-group"
                }, [i("FormItem", {
                    staticClass: "input-group__item",
                    attrs: {
                        label: "Длина:",
                        errors: t.validation["rectangle.width"],
                        htmlFor: "rectangle.width"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "rectangle.width",
                        name: "width",
                        placeholder: "Длина",
                        type: "number",
                        min: t.limits.width.min,
                        max: t.limits.width.max,
                        icon: "form_width",
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.width,
                        callback: function (e) {
                            t.width = e
                        },
                        expression: "width"
                    }
                })], 1), t._v(" "), i("FormItem", {
                    staticClass: "input-group__item",
                    attrs: {
                        label: "Ширина:",
                        errors: t.validation["rectangle.height"],
                        htmlFor: "rectangle.height"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "rectangle.height",
                        name: "height",
                        placeholder: "Ширина",
                        type: "number",
                        min: t.limits.height.min,
                        max: t.limits.height.max,
                        icon: "form_height",
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.height,
                        callback: function (e) {
                            t.height = e
                        },
                        expression: "height"
                    }
                })], 1)], 1), t._v(" "), i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Радиус углов:",
                        errors: t.validation["rectangle.radius"],
                        htmlFor: "rectangle.radius"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "rectangle.radius",
                        name: "radius",
                        placeholder: "Радиус углов",
                        type: "number",
                        min: 0,
                        max: t.radiusMax,
                        icon: "form_corner-radius",
                        block: ""
                    },
                    model: {
                        value: t.radius,
                        callback: function (e) {
                            t.radius = e
                        },
                        expression: "radius"
                    }
                })], 1)], 1)
            }, [], !1, null, null, null).exports,
            Tt = Object(r.a)({
                getterType: "shape/getField",
                mutationType: "shape/updateField"
            }).mapFields,
            Ht = {
                name: "ConstructorCircle",
                components: {
                    Input: R,
                    FormItem: O
                },
                computed: n()({}, Tt({
                    diameter: "circle.diameter"
                }), Object(a.c)({
                    limits: "materialLimits"
                }), Object(a.e)({
                    validation: function (t) {
                        return t.errors.validation
                    }
                }), {
                    diameterLimitMax: function () {
                        return Math.min(this.limits.width.max, this.limits.height.max)
                    },
                    diameterLimitMin: function () {
                        return Math.max(this.limits.width.min, this.limits.height.min)
                    }
                })
            },
            Pt = Object(f.a)(Ht, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    staticClass: "circle"
                }, [i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Диаметр:",
                        errors: t.validation["circle.diameter"],
                        htmlFor: "circle.diameter"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "circle.diameter",
                        name: "diameter",
                        type: "number",
                        placeholder: "Диаметр",
                        min: t.diameterLimitMin,
                        max: t.diameterLimitMax,
                        icon: "form_width",
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.diameter,
                        callback: function (e) {
                            t.diameter = e
                        },
                        expression: "diameter"
                    }
                })], 1)], 1)
            }, [], !1, null, null, null).exports,
            Rt = Object(r.a)({
                getterType: "shape/getField",
                mutationType: "shape/updateField"
            }).mapFields,
            Ft = {
                name: "ConstructorTriangle",
                components: {
                    Input: R,
                    FormItem: O
                },
                computed: n()({}, Rt({
                    side1: "triangle.side1",
                    side2: "triangle.side2"
                }), Object(a.c)({
                    limits: "materialLimits"
                }), Object(a.e)({
                    validation: function (t) {
                        return t.errors.validation
                    }
                }))
            },
            Nt = Object(f.a)(Ft, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    staticClass: "triangle"
                }, [i("div", {
                    staticClass: "form__item input-group"
                }, [i("FormItem", {
                    staticClass: "input-group__item",
                    attrs: {
                        label: "Катет 1:",
                        errors: t.validation["triangle.side1"],
                        htmlFor: "triangle.side1"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "triangle.side1",
                        name: "side1",
                        type: "number",
                        placeholder: "Катет 1",
                        min: t.limits.height.min,
                        max: t.limits.height.max,
                        icon: "form_height",
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.side1,
                        callback: function (e) {
                            t.side1 = e
                        },
                        expression: "side1"
                    }
                })], 1), t._v(" "), i("FormItem", {
                    staticClass: "input-group__item",
                    attrs: {
                        label: "Катет 2:",
                        errors: t.validation["triangle.side2"],
                        htmlFor: "triangle.side2"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "triangle.side2",
                        name: "side2",
                        type: "number",
                        placeholder: "Катет 2",
                        min: t.limits.width.min,
                        max: t.limits.width.max,
                        icon: "form_width",
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.side2,
                        callback: function (e) {
                            t.side2 = e
                        },
                        expression: "side2"
                    }
                })], 1)], 1)])
            }, [], !1, null, null, null).exports,
            Mt = {
                name: "ConstructorHolesListItem",
                components: {
                    Button: _,
                    Icon: T
                },
                props: {
                    id: String,
                    index: {
                        type: Number,
                        default: 1
                    }
                },
                data: function () {
                    return {
                        modalIsOpen: !1
                    }
                },
                computed: n()({}, Object(a.c)({
                    getHoleById: "shape/getHoleById"
                }), Object(a.e)({
                    validation: function (t) {
                        return t.errors.validation
                    }
                }), {
                    hole: function () {
                        return this.getHoleById(this.id)
                    },
                    errors: function () {
                        return this.validation["holes." + this.id] || []
                    },
                    isNotValid: function () {
                        return this.errors.length > 0
                    },
                    isHovered: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].isHovered
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".isHovered";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    classes: function () {
                        return ["holes-list-item", {
                            "holes-list-item_hovered": this.isHovered,
                            "holes-list-item_errored": this.isNotValid
                        }]
                    }
                }),
                methods: n()({}, Object(a.b)({
                    holeEditOpen: "holeEdit/" + o.f,
                    openModal: l.PUSH
                }), {
                    handleEditClick: function () {
                        this.holeEditOpen({
                            id: this.id,
                            mode: "edit"
                        })
                    },
                    handleRemoveClick: function () {
                        this.openModal({
                            name: "deleteHole",
                            holeId: this.id
                        })
                    },
                    onHoleMouseOver: function () {
                        this.isHovered || (this.isHovered = !0)
                    },
                    onHoleMouseOut: function () {
                        this.isHovered && (this.isHovered = !1)
                    }
                })
            },
            $t = (i("wm2O"), {
                name: "ConstructorHolesList",
                components: {
                    Button: _,
                    HolesListItem: Object(f.a)(Mt, function () {
                        var t = this,
                            e = t.$createElement,
                            i = t._self._c || e;
                        return i("div", {
                            class: t.classes,
                            on: {
                                mouseover: t.onHoleMouseOver,
                                mouseout: t.onHoleMouseOut
                            }
                        }, [i("div", {
                            staticClass: "holes-list-item__name"
                        }, [t._v("Отверстие №" + t._s(t.index + 1))]), t._v(" "), i("div", {
                            staticClass: "holes-list-item__controls"
                        }, [i("Button", {
                            staticClass: "holes-list-item__controls-item",
                            on: {
                                click: t.handleEditClick
                            }
                        }, [i("Icon", {
                            class: "\n          holes-list-item__controls-icon\n          holes-list-item__controls-icon_edit\n        ",
                            attrs: {
                                name: "hole-items_edit"
                            }
                        }), t._v(" "), i("span", {
                            staticClass: "visuallyhidden"
                        }, [t._v("Редактировать отверстие")])], 1), t._v(" "), i("Button", {
                            staticClass: "holes-list-item__controls-item",
                            on: {
                                click: t.handleRemoveClick
                            }
                        }, [i("Icon", {
                            class: "\n          holes-list-item__controls-icon\n          holes-list-item__controls-icon_delete\n        ",
                            attrs: {
                                name: "hole-items_delete"
                            }
                        }), t._v(" "), i("span", {
                            staticClass: "visuallyhidden"
                        }, [t._v("Удалить отверстие")])], 1)], 1)])
                    }, [], !1, null, null, null).exports
                },
                data: function () {
                    return {
                        holeId: null
                    }
                },
                computed: n()({}, Object(a.c)({
                    holesAllIds: "shape/getHolesAllIds"
                })),
                methods: n()({}, Object(a.b)({
                    holeEditOpen: "holeEdit/" + o.f,
                    holeEditClose: "holeEdit/" + o.e,
                    addHole: "shape/" + o.a
                }), {
                    handleAddHoleClick: function () {
                        var t = this;
                        this.addHole().then(function (e) {
                            var i = e.id;
                            t.editHole(i)
                        })
                    },
                    editHole: function (t) {
                        this.holeId = t, this.holeEditOpen({
                            id: t
                        })
                    }
                })
            }),
            jt = Object(f.a)($t, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "holes-list"
                }, [e("div", {
                    staticClass: "holes-list__add"
                }, [e("Button", {
                    attrs: {
                        color: "blue",
                        theme: "solid rounded",
                        block: ""
                    },
                    on: {
                        click: this.handleAddHoleClick
                    }
                }, [this._v("\n      Добавить отверстие\n    ")])], 1), this._v(" "), this.holesAllIds.length > 0 ? e("ul", {
                    staticClass: "holes-list__list"
                }, this._l(this.holesAllIds, function (t, i) {
                    return e("li", {
                        key: t,
                        staticClass: "holes-list__item"
                    }, [e("HolesListItem", {
                        attrs: {
                            id: t,
                            index: i
                        }
                    })], 1)
                })) : this._e()])
            }, [], !1, null, null, null).exports,
            At = {
                name: "ConstructorResults",
                components: {
                    Button: _,
                    Icon: T,
                    FormItem: O,
                    Fieldset: k,
                    Input: R,
                    Select: j,
                    Tooltip: q
                },
                props: {
                    data: {
                        type: Object,
                        default: function () {
                            return {}
                        }
                    }
                },
                data: function () {
                    return {
                        isTooltipOpen: !1,
                        isLoading: !1
                    }
                },
                methods: n()({}, Object(a.b)({
                    addToCart: "shape/" + o.b
                }), {
                    tooltipShow: function () {
                        this.isTooltipOpen = !0
                    },
                    tooltipHide: function () {
                        this.isTooltipOpen = !1
                    },
                    add: function () {
                        var t = this;
                        this.isLoading = !0, this.addToCart().then(function () {
                            t.isLoading = !1
                        }).catch(function () {
                            t.isLoading = !1
                        })
                    }
                })
            },
            Lt = Object(f.a)(At, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    staticClass: "results-table"
                }, [i("div", {
                    staticClass: "results-table__section-item"
                }, [i("div", {
                    staticClass: "results-table__top"
                }, [i("div", {
                    staticClass: "results-table__item"
                }, [t._m(0), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v(t._s(t._f("currency")(t.data.price)) + " сом")])])]), t._v(" "), i("div", {
                    staticClass: "results-table__item"
                }, [i("div", {
                    staticClass: "results-table__label"
                }, [i("span", [t._v("Изготовление")]), t._v(" "), i("Button", {
                    directives: [{
                        name: "click-outside",
                        rawName: "v-click-outside",
                        value: t.tooltipHide,
                        expression: "tooltipHide"
                    }],
                    staticClass: "results-table__tip",
                    attrs: {
                        "data-tooltip-id": "tip",
                        "data-tooltip-placement": "top"
                    },
                    on: {
                        click: t.tooltipShow
                    }
                }, [i("Icon", {
                    attrs: {
                        name: "question-tooltip"
                    }
                })], 1), t._v(" "), i("Tooltip", {
                    style: "\n              top: -43px;\n              left: 356px;\n            ",
                    attrs: {
                        open: t.isTooltipOpen,
                        "x-placement": "top"
                    }
                }, [t._v("\n            В рассчет срока изготовления заказа влючаются только календарные\n            рабочие дни.\n          ")])], 1), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v("\n            " + t._s(t._f("pluralize")(t.data.createDays, "день", "дня", "дней")) + "\n          ")])])]), t._v(" "), i("div", {
                    staticClass: "results-table__item ta-right"
                }, [i("Button", {
                    attrs: {
                        disabled: t.isLoading,
                        color: "green",
                        theme: "solid rounded",
                        icon: ""
                    },
                    on: {
                        click: t.addToCart
                    }
                }, [i("Icon", {
                    attrs: {
                        name: "cart"
                    }
                }), t._v(" "), i("span", [t._v("В корзину")])], 1)], 1)]), t._v(" "), i("div", {
                    staticClass: "results-table__bottom"
                }, [i("div", {
                    staticClass: "results-table__section"
                }, [i("div", {
                    staticClass: "results-table__item"
                }, [t._m(1), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v("\n              " + t._s({
                    triangle: "Треугольник",
                    circle: "Круг",
                    rectangle: "Квадрат/Прямоугольник"
                }[t.data.shapeType]) + "\n            ")])])]), t._v(" "), i("div", {
                    staticClass: "results-table__item"
                }, [t._m(2), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v(t._s(t.data.materialTitle))])])]), t._v(" "), i("div", {
                    staticClass: "results-table__item"
                }, [t._m(3), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v(t._s(t.data.cutTypeTitle))])])]), t._v(" "), i("div", {
                    staticClass: "results-table__item"
                }, [t._m(4), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v(t._s(t.data.count) + " шт.")])])])]), t._v(" "), i("div", {
                    staticClass: "results-table__section"
                }, [i("div", {
                    staticClass: "results-table__item"
                }, [t._m(5), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v(t._s(t.data.width) + " - " + t._s(t.data.height) + " мм.")])])]), t._v(" "), i("div", {
                    staticClass: "results-table__item"
                }, [t._m(6), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v(t._s(t.data.cutLength) + " мм")])])]), t._v(" "), i("div", {
                    staticClass: "results-table__item"
                }, [t._m(7), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v(t._s(t.data.area) + " мм\n              "), i("sup", [t._v("2")])])])]), t._v(" "), i("div", {
                    staticClass: "results-table__item"
                }, [t._m(8), t._v(" "), i("div", {
                    staticClass: "results-table__text"
                }, [i("span", [t._v(t._s(t.data.mass) + " г.")])])])])])])])
            }, [function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Стоимость")])])
            }, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Форма детали:")])])
            }, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Материал детали:")])])
            }, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Тип резки:")])])
            }, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Количество:")])])
            }, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Длина - Ширина:")])])
            }, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Длина реза:")])])
            }, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Площадь:")])])
            }, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "results-table__label"
                }, [e("span", [this._v("Масса 1 детали:")])])
            }], !1, null, null, null).exports,
            Bt = i("mvHQ"),
            Dt = i.n(Bt),
            Wt = i("Du/2"),
            zt = {
                name: "ConstructorHolePosition",
                components: {
                    Radio: N,
                    Fieldset: k,
                    FormItem: O,
                    Tooltip: q,
                    Button: _
                },
                props: {
                    id: String
                },
                computed: n()({}, Object(a.e)({
                    shapeType: function (t) {
                        return t.shape.type
                    }
                }), Object(a.c)({
                    isRectangle: "shape/isRectangle",
                    isTriangle: "shape/isTriangle",
                    isCircle: "shape/isCircle"
                }), {
                    rectanglePoint: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].position.zeroPoint.rectangle
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".position.zeroPoint.rectangle";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    trianglePoint: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].position.zeroPoint.triangle
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".position.zeroPoint.triangle";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    circlePoint: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].position.zeroPoint.circle
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".position.zeroPoint.circle";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    hole: function () {
                        return this.$store.state.shape.holes[this.id]
                    },
                    holeType: function () {
                        return this.hole.type
                    },
                    holePoint: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].position.zeroPoint.hole
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".position.zeroPoint.hole";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    shapePosition: function () {
                        switch (this.shapeType) {
                            case "rectangle":
                                return this.rectanglePoint;
                            case "circle":
                                return this.circlePoint;
                            case "triangle":
                                return this.trianglePoint;
                            default:
                                return ""
                        }
                    },
                    classes: function () {
                        return ["hole-position", "hole-position_shape-type_" + this.shapeType, "hole-position_shape-position_" + this.shapePosition, "hole-position_hole-type_" + this.holeType, "hole-position_hole-position_" + this.holePoint]
                    }
                }),
                methods: {
                    switchHolePosition: function () {
                        this.holePoint = "side" === this.holePoint ? "center" : "side"
                    }
                }
            },
            qt = {
                name: "ConstructorHoleForm",
                components: {
                    Input: R,
                    Radio: N,
                    Fieldset: k,
                    FormItem: O,
                    Button: _,
                    HolePosition: Object(f.a)(zt, function () {
                        var t = this,
                            e = t.$createElement,
                            i = t._self._c || e;
                        return i("div", {
                            class: t.classes
                        }, [i("Button", {
                            staticClass: "hole-position__hole-switch",
                            attrs: {
                                title: "Переключить точку отсчета отверстия"
                            },
                            on: {
                                click: t.switchHolePosition
                            }
                        }, [i("span", {
                            staticClass: "visuallyhidden"
                        }, [t._v("Переключить точку отсчета отверстия")])]), t._v(" "), t._l([{
                            label: "Верхний левый угол",
                            value: "top-left"
                        }, {
                            label: "Верхний правый угол",
                            value: "top-right"
                        }, {
                            label: "Нижний правый угол",
                            value: "bottom-right"
                        }, {
                            label: "Нижний левый угол",
                            value: "bottom-left"
                        }], function (e) {
                            var s = e.value,
                                n = e.label;
                            return t.isRectangle ? i("Radio", {
                                key: s,
                                class: ["radio_only-marker", "hole-position__item-shape", "hole-position__item-shape_" + s],
                                attrs: {
                                    value: s,
                                    label: n,
                                    name: "hole-position_rectangle",
                                    labelHidden: !0
                                },
                                model: {
                                    value: t.rectanglePoint,
                                    callback: function (e) {
                                        t.rectanglePoint = e
                                    },
                                    expression: "rectanglePoint"
                                }
                            }) : t._e()
                        }), t._v(" "), t._l([{
                            label: "От края фигуры",
                            value: "side"
                        }, {
                            label: "От центра фигуры",
                            value: "center"
                        }], function (e) {
                            var s = e.value,
                                n = e.label;
                            return t.isCircle ? i("Radio", {
                                key: s,
                                class: ["radio_only-marker", "hole-position__item-shape", "hole-position__item-shape_" + s],
                                attrs: {
                                    value: s,
                                    label: n,
                                    name: "hole-position_circle",
                                    labelHidden: !0
                                },
                                model: {
                                    value: t.circlePoint,
                                    callback: function (e) {
                                        t.circlePoint = e
                                    },
                                    expression: "circlePoint"
                                }
                            }) : t._e()
                        })], 2)
                    }, [], !1, null, null, null).exports,
                    InputGroup: B
                },
                props: {
                    id: {
                        type: String
                    }
                },
                computed: n()({
                    type: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].type
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".type";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    x: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].position.x
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".position.x";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    y: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].position.y
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".position.y";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    l: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].position.l
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".position.l";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    angle: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].position.angle
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".position.angle";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    width: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].width
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".width";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    height: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].height
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".height";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    radius: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].radius
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".radius";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    diameter: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].diameter
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".diameter";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    errors: function () {
                        return this.validation["holes." + this.id] || []
                    },
                    isRectangleHole: function () {
                        return "rectangle" === this.type
                    },
                    isCircleleHole: function () {
                        return "circle" === this.type
                    }
                }, Object(a.e)({
                    holeEditMode: function (t) {
                        return t.holeEdit.params.mode || "new"
                    },
                    validation: function (t) {
                        return t.errors.validation
                    }
                }), Object(a.c)({
                    getHoleById: "shape/getHoleById",
                    isRectangleShape: "shape/isRectangle",
                    isTriangleShape: "shape/isTriangle",
                    isCircleShape: "shape/isCircle"
                })),
                created: function () {
                    this.holeSnapShot = JSON.parse(Dt()(this.getHoleById(this.id)))
                },
                beforeUpdate: function () {
                    (this.isTriangleShape || this.isCircleShape) && (this.type = "circle")
                },
                methods: n()({}, Object(a.d)({
                    removeHole: "shape/" + Wt.f,
                    updateHole: "shape/" + Wt.m
                }), Object(a.b)({
                    holeEditClose: "holeEdit/" + o.e
                }), {
                    handleCancleClick: function () {
                        "new" === this.holeEditMode && this.removeHole(this.id), "edit" === this.holeEditMode && this.updateHole({
                            id: this.id,
                            data: this.holeSnapShot
                        }), this.holeEditClose()
                    },
                    handleAddClick: function () {
                        this.holeEditClose()
                    }
                })
            },
            Vt = Object(f.a)(qt, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    staticClass: "hole-form"
                }, [i("h3", {
                    staticClass: "hole-form__title"
                }, [t._v("Добавить отверстие:")]), t._v(" "), i("div", {
                    staticClass: "hole-form__section"
                }, [i("ul", {
                    staticClass: "erorr-list"
                }, t._l(t.errors, function (e) {
                    var s = e.message;
                    return i("li", {
                        key: s,
                        staticClass: "erorr-list__item"
                    }, [t._v("\n         " + t._s(s) + "\n       ")])
                }))]), t._v(" "), i("div", {
                    staticClass: "hole-form__section"
                }, [i("div", {
                    staticClass: "hole-form__col"
                }, [i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Расположение:"
                    }
                }, [i("HolePosition", {
                    attrs: {
                        id: t.id
                    }
                })], 1)], 1), t._v(" "), i("div", {
                    staticClass: "hole-form__col"
                }, [t.isRectangleShape || t.isTriangleShape ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Ось X:",
                        htmlFor: "hole.position.x"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "hole.position.x",
                        name: "position.x",
                        placeholder: "0 мм",
                        type: "number",
                        min: 0,
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.x,
                        callback: function (e) {
                            t.x = e
                        },
                        expression: "x"
                    }
                })], 1) : t._e(), t._v(" "), t.isRectangleShape || t.isTriangleShape ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Ось Y:",
                        htmlFor: "hole.position.y"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "hole.position.y",
                        name: "position.y",
                        type: "number",
                        placeholder: "0 мм",
                        min: 0,
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.y,
                        callback: function (e) {
                            t.y = e
                        },
                        expression: "y"
                    }
                })], 1) : t._e(), t._v(" "), t.isCircleShape ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Угол α°:",
                        htmlFor: "hole.position.angle"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "hole.position.angle",
                        name: "position.angle",
                        placeholder: "0 deg",
                        type: "number",
                        block: ""
                    },
                    model: {
                        value: t.angle,
                        callback: function (e) {
                            t.angle = e
                        },
                        expression: "angle"
                    }
                })], 1) : t._e(), t._v(" "), t.isCircleShape ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Расстояние L:",
                        htmlFor: "hole.position.l"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "hole.position.l",
                        name: "position.l",
                        placeholder: "0 мм",
                        type: "number",
                        min: 0,
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.l,
                        callback: function (e) {
                            t.l = e
                        },
                        expression: "l"
                    }
                })], 1) : t._e()], 1)]), t._v(" "), i("div", {
                    staticClass: "hole-form__section"
                }, [i("div", {
                    staticClass: "hole-form__col"
                }, [t.isRectangleShape ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Форма:"
                    }
                }, [i("InputGroup", {
                    attrs: {
                        theme: "inline rounded grow"
                    }
                }, t._l([{
                    label: "Прямоугольник",
                    value: "rectangle",
                    className: ["vue_radio-sw-shape", "vue_radio-sw-shape_rectangle"]
                }, {
                    label: "Круг",
                    value: "circle",
                    className: ["vue_radio-sw-shape", "vue_radio-sw-shape_circle"]
                }], function (e) {
                    var s = e.label,
                        n = e.value,
                        a = e.className;
                    return i("Radio", {
                        key: s,
                        attrs: {
                            theme: "button",
                            value: n,
                            boxHelper: !1
                        },
                        model: {
                            value: t.type,
                            callback: function (e) {
                                t.type = e
                            },
                            expression: "type"
                        }
                    }, [i("span", {
                        class: a
                    }), t._v(" "), i("span", {
                        staticClass: "visuallyhidden"
                    }, [t._v(t._s(s))])])
                }))], 1) : t._e(), t._v(" "), t.isRectangleHole ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Радиус углов:",
                        htmlFor: "hole.radius"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "hole.radius",
                        name: "hole.radius",
                        placeholder: "0 мм",
                        type: "number",
                        min: 0,
                        block: ""
                    },
                    model: {
                        value: t.radius,
                        callback: function (e) {
                            t.radius = e
                        },
                        expression: "radius"
                    }
                })], 1) : t._e()], 1), t._v(" "), i("div", {
                    staticClass: "hole-form__col"
                }, [t.isRectangleHole ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Длина:",
                        htmlFor: "hole.width"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "hole.width",
                        name: "hole.width",
                        placeholder: "0 мм",
                        type: "number",
                        min: 1,
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.width,
                        callback: function (e) {
                            t.width = e
                        },
                        expression: "width"
                    }
                })], 1) : t._e(), t._v(" "), t.isRectangleHole ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Ширина:",
                        htmlFor: "hole.height"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "hole.height",
                        name: "hole.height",
                        placeholder: "0 мм",
                        type: "number",
                        min: 1,
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.height,
                        callback: function (e) {
                            t.height = e
                        },
                        expression: "height"
                    }
                })], 1) : t._e()], 1)]), t._v(" "), i("div", {
                    staticClass: "hole-form__section"
                }, [i("div", {
                    staticClass: "hole-form__col hole-form__col_full-width"
                }, [t.isCircleleHole ? i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Диаметр отверстия:",
                        htmlFor: "hole.diameter"
                    }
                }, [i("Input", {
                    attrs: {
                        name: "hole.diameter",
                        id: "hole.diameter",
                        type: "number",
                        min: 1,
                        step: "0.1",
                        block: ""
                    },
                    model: {
                        value: t.diameter,
                        callback: function (e) {
                            t.diameter = e
                        },
                        expression: "diameter"
                    }
                })], 1) : t._e()], 1)]), t._v(" "), i("div", {
                    staticClass: "hole-form__controls"
                }, [i("div", {
                    staticClass: "hole-form__controls-item"
                }, [i("Button", {
                    attrs: {
                        color: "gray",
                        theme: "solid rounded",
                        block: ""
                    },
                    on: {
                        click: t.handleCancleClick
                    }
                }, [t._v("\n         Отмена\n       ")])], 1), t._v(" "), i("div", {
                    staticClass: "hole-form__controls-item"
                }, [i("Button", {
                    attrs: {
                        color: "blue",
                        theme: "solid rounded",
                        block: ""
                    },
                    on: {
                        click: t.handleAddClick
                    }
                }, [t._v("\n         " + t._s("new" === t.holeEditMode ? "Добавить" : "Сохранить") + "\n       ")])], 1)])])
            }, [], !1, null, null, null).exports,
            Zt = {
                name: "ConstructorRemoveHoleModal",
                components: {
                    Modal: l.Modal,
                    Dialog: W,
                    Button: _
                },
                computed: n()({}, Object(a.e)({
                    modals: function (t) {
                        return t.modal.stack || []
                    }
                }), {
                    holeId: function () {
                        return this.modals.find(function (t) {
                            return "deleteHole" === t.name
                        }).holeId
                    }
                }),
                methods: n()({}, Object(a.d)({
                    REMOVE_HOLE: "shape/" + Wt.f
                }), Object(a.b)({
                    holeEditClose: "holeEdit/" + o.e,
                    closeModal: l.POP
                }), {
                    onDelete: function () {
                        this.REMOVE_HOLE(this.holeId), this.closeModal({
                            name: "deleteHole"
                        })
                    }
                })
            },
            Ut = Object(f.a)(Zt, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("Modal", {
                    attrs: {
                        name: "deleteHole",
                        "disable-backdrop": !0
                    }
                }, [i("Dialog", {
                    attrs: {
                        name: "deleteHole",
                        title: "Удалить отверстие?",
                        close: t.closeModal
                    }
                }, [i("p", [t._v("Вы действительно хотите удалить отверстие?")]), t._v(" "), i("template", {
                    slot: "footer"
                }, [i("Button", {
                    attrs: {
                        color: "gray",
                        size: "m",
                        theme: "solid rounded"
                    },
                    on: {
                        click: t.closeModal
                    }
                }, [t._v("\n        Отмена\n      ")]), t._v("\n       \n      "), i("Button", {
                    attrs: {
                        color: "orange",
                        size: "m",
                        theme: "solid rounded"
                    },
                    on: {
                        click: t.onDelete
                    }
                }, [t._v("\n        Удалить\n      ")])], 1)], 2)], 1)
            }, [], !1, null, null, null).exports,
            Xt = {
                name: "ConstructorChangeShapeTypeModal",
                components: {
                    Modal: l.Modal,
                    Dialog: W,
                    Button: _
                },
                props: {
                    onSuccess: {
                        type: Function,
                        default: function () {}
                    },
                    onCancel: {
                        type: Function,
                        default: function () {}
                    },
                    onClose: {
                        type: Function,
                        default: function () {}
                    }
                }
            },
            Yt = Object(f.a)(Xt, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("Modal", {
                    attrs: {
                        name: "changeShape",
                        "disable-backdrop": !0
                    }
                }, [i("Dialog", {
                    attrs: {
                        name: "changeShape",
                        title: "Удалить все отверстия?",
                        close: t.onClose
                    }
                }, [i("p", [t._v("\n      При смене формы детали, позиционировние отверстий будет утеряно.\n      "), i("br"), t._v("\n      Что будем делать?\n    ")]), t._v(" "), i("template", {
                    slot: "footer"
                }, [i("Button", {
                    attrs: {
                        color: "gray",
                        size: "m",
                        theme: "solid rounded"
                    },
                    on: {
                        click: t.onCancel
                    }
                }, [t._v("\n        Оставить отверстия\n      ")]), t._v("\n       \n      "), i("Button", {
                    attrs: {
                        color: "orange",
                        size: "m",
                        theme: "solid rounded"
                    },
                    on: {
                        click: t.onSuccess
                    }
                }, [t._v("\n        Удалить отверстия\n      ")])], 1)], 2)], 1)
            }, [], !1, null, null, null).exports,
            Gt = {
                name: "ConstructorModifyShapeModal",
                components: {
                    Modal: l.Modal,
                    Dialog: W,
                    Button: _
                },
                props: {
                    onSuccess: {
                        type: Function,
                        default: function () {}
                    },
                    onCancel: {
                        type: Function,
                        default: function () {}
                    },
                    onClose: {
                        type: Function,
                        default: function () {}
                    },
                    shapeName: {
                        type: String,
                        default: ""
                    }
                }
            },
            Jt = Object(f.a)(Gt, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("Modal", {
                    attrs: {
                        name: "modifyShape",
                        "disable-backdrop": !0
                    }
                }, [i("Dialog", {
                    attrs: {
                        name: "modifyShape",
                        title: "Перезаписать деталь?",
                        close: t.onClose
                    }
                }, [i("p", [t._v("\n      Деталь «" + t._s(t.shapeName) + "» будет отредактирована.\n      "), i("br"), t._v("\n      Перезаписать деталь?\n    ")]), t._v(" "), i("template", {
                    slot: "footer"
                }, [i("Button", {
                    attrs: {
                        color: "gray",
                        size: "m",
                        theme: "solid rounded"
                    },
                    on: {
                        click: t.onCancel
                    }
                }, [t._v("\n        Отмена\n      ")]), t._v("\n       \n      "), i("Button", {
                    attrs: {
                        color: "orange",
                        size: "m",
                        theme: "solid rounded"
                    },
                    on: {
                        click: t.onSuccess
                    }
                }, [t._v("\n        Перезаписать\n      ")])], 1)], 2)], 1)
            }, [], !1, null, null, null).exports,
            Qt = {
                name: "DrawHole",
                components: {
                    SvgRectangle: lt,
                    SvgCircle: ut
                },
                props: {
                    id: String
                },
                computed: n()({}, Object(a.e)({
                    hole: function (t) {
                        return t.shape.holes[this.id]
                    },
                    shapeType: function (t) {
                        return t.shape.type
                    },
                    validation: function (t) {
                        return t.errors.validation
                    }
                }), Object(a.c)({
                    isRectangle: "shape/isRectangle",
                    isCircle: "shape/isCircle",
                    isTriangle: "shape/isTriangle",
                    shape: "shape/shape"
                }), {
                    errors: function () {
                        return this.validation["holes." + this.id] || []
                    },
                    isNotValid: function () {
                        return this.errors.length > 0
                    },
                    isHovered: {
                        get: function () {
                            return this.$store.state.shape.holes[this.id].isHovered
                        },
                        set: function (t) {
                            var e = "holes." + this.id + ".isHovered";
                            this.$store.commit("shape/updateField", {
                                path: e,
                                value: t
                            })
                        }
                    },
                    holeColor: function () {
                        return this.isHovered ? E.g : this.isNotValid ? E.i : E.h
                    },
                    holeType: function () {
                        return this.hole.type
                    },
                    shapeZeroPoint: function () {
                        return this.hole.position.zeroPoint[this.shapeType]
                    },
                    holeZeroPoint: function () {
                        return this.hole.position.zeroPoint.hole
                    },
                    position: function () {
                        var t = parseInt(this.hole.width, 10),
                            e = parseInt(this.hole.height, 10),
                            i = parseInt(this.hole.position.x, 10),
                            s = parseInt(this.hole.position.y, 10),
                            n = parseInt(this.shape.width, 10),
                            a = parseInt(this.shape.height, 10),
                            o = parseInt(this.hole.diameter, 10),
                            r = parseInt(this.shape.diameter, 10),
                            l = parseInt(this.hole.position.l, 10),
                            c = parseInt(this.hole.position.angle, 10),
                            u = parseInt(this.shape.side1, 10),
                            h = parseInt(this.shape.side2, 10);
                        switch ([this.shapeType, this.holeType].join(" ")) {
                            case "rectangle rectangle":
                                return this.calculateRectanglePosition({
                                    holeWidth: t,
                                    holeHeight: e,
                                    positionX: i,
                                    positionY: s,
                                    shapeWidth: n,
                                    shapeHeight: a
                                });
                            case "rectangle circle":
                                return this.calculateRectanglePosition({
                                    holeWidth: o,
                                    holeHeight: o,
                                    positionX: i,
                                    positionY: s,
                                    shapeWidth: n,
                                    shapeHeight: a
                                });
                            case "circle circle":
                                return this.calculateRadialPosition({
                                    holeDiameter: o,
                                    distance: l,
                                    angle: c,
                                    shapeDiameter: r
                                });
                            case "triangle circle":
                                return this.calculateRectanglePosition({
                                    holeWidth: o,
                                    holeHeight: o,
                                    positionX: i,
                                    positionY: s,
                                    shapeWidth: h,
                                    shapeHeight: u
                                });
                            default:
                                return [0, 0]
                        }
                    }
                }),
                methods: {
                    calculateRectanglePosition: function (t) {
                        var e = t.holeWidth,
                            i = t.holeHeight,
                            s = t.positionX,
                            n = t.positionY,
                            a = t.shapeWidth,
                            o = t.shapeHeight,
                            r = e / 2,
                            l = i / 2;
                        switch ([this.shapeZeroPoint, this.holeZeroPoint].join(" ")) {
                            case "top-left center":
                                return [s - r, n - l];
                            case "top-left side":
                                return [s, n];
                            case "top-right center":
                                return [a - e - s + r, n - l];
                            case "top-right side":
                                return [a - e - s, n];
                            case "bottom-right center":
                                return [a - e - s + r, o - i - n + r];
                            case "bottom-right side":
                                return [a - e - s, o - i - n];
                            case "bottom-left center":
                                return [s - r, o - i - n + r];
                            case "bottom-left side":
                                return [s, o - i - n];
                            default:
                                return [0, 0]
                        }
                    },
                    calculateRadialPosition: function (t) {
                        var e = t.angle,
                            i = t.distance,
                            s = t.holeDiameter,
                            n = t.shapeDiameter,
                            a = Math.round(s / 2),
                            o = n / 2,
                            r = function (t) {
                                return t * Math.PI / 180
                            }(e),
                            l = 0;
                        switch ([this.shapeZeroPoint, this.holeZeroPoint].join(" ")) {
                            case "center center":
                                l = i;
                                break;
                            case "center side":
                                l = i + a;
                                break;
                            case "side center":
                                l = o - i;
                                break;
                            case "side side":
                                l = o - i - a
                        }
                        return [o + l * Math.sin(r) - a, o - l * Math.cos(r) - a]
                    },
                    onMouseOver: function () {
                        this.isHovered = !0
                    },
                    onMouseLeave: function () {
                        this.isHovered = !1
                    }
                }
            },
            Kt = (i("oPwn"), {
                name: "DrawHolesList",
                components: {
                    Hole: Object(f.a)(Qt, function () {
                        var t = this,
                            e = t.$createElement,
                            i = t._self._c || e;
                        return i("g", {
                            staticClass: "hole",
                            on: {
                                mouseover: t.onMouseOver,
                                mouseleave: t.onMouseLeave
                            }
                        }, ["rectangle" === t.hole.type ? i("SvgRectangle", {
                            key: t.hole.id,
                            staticClass: "hole__item hole__item_rectangle",
                            attrs: {
                                id: t.hole.id,
                                fillColor: t.holeColor,
                                width: t.hole.width,
                                height: t.hole.height,
                                radius: t.hole.radius,
                                x: t.position[0].toString(),
                                y: t.position[1].toString()
                            }
                        }) : t._e(), t._v(" "), "circle" === t.hole.type ? i("SvgCircle", {
                            key: t.hole.id,
                            staticClass: "hole__item hole__item_circle",
                            attrs: {
                                id: t.hole.id,
                                fillColor: t.holeColor,
                                diameter: t.hole.diameter,
                                cx: t.position[0].toString(),
                                cy: t.position[1].toString()
                            }
                        }) : t._e()], 1)
                    }, [], !1, null, "02707b0d", null).exports
                },
                computed: n()({}, Object(a.c)({
                    holes: "shape/getHolesAllIds",
                    isHaveHoles: "shape/isHaveHoles"
                }))
            }),
            te = {
                name: "DrawShape",
                components: {
                    SvgRectangle: lt,
                    SvgCircle: ut,
                    SvgTriangle: mt,
                    HolesList: Object(f.a)(Kt, function () {
                        var t = this.$createElement,
                            e = this._self._c || t;
                        return this.isHaveHoles ? e("g", {
                            staticClass: "holes-list"
                        }, this._l(this.holes, function (t) {
                            return e("Hole", {
                                key: t,
                                staticClass: "hole-list__item",
                                attrs: {
                                    id: t
                                }
                            })
                        })) : this._e()
                    }, [], !1, null, null, null).exports
                },
                data: function () {
                    return {
                        style: E.l
                    }
                },
                computed: n()({}, Object(a.c)({
                    shape: "shape/shape",
                    isRectangle: "shape/isRectangle",
                    isCircle: "shape/isCircle",
                    isTriangle: "shape/isTriangle",
                    isHaveHoles: "shape/isHaveHoles"
                }))
            },
            ee = Object(f.a)(te, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("g", {
                    staticClass: "shape"
                }, [t.isRectangle ? i("SvgRectangle", {
                    staticClass: "shape__rectangle",
                    style: t.style,
                    attrs: {
                        width: t.shape.width,
                        height: t.shape.height,
                        radius: t.shape.radius
                    }
                }) : t._e(), t._v(" "), t.isCircle ? i("SvgCircle", {
                    staticClass: "shape__circle",
                    style: t.style,
                    attrs: {
                        diameter: t.shape.diameter
                    }
                }) : t._e(), t._v(" "), t.isTriangle ? i("SvgTriangle", {
                    staticClass: "shape__triangle",
                    style: t.style,
                    attrs: {
                        side1: t.shape.side1,
                        side2: t.shape.side2
                    }
                }) : t._e(), t._v(" "), i("HolesList", {
                    staticClass: "shape__holes"
                })], 1)
            }, [], !1, null, null, null).exports,
            ie = {
                name: "DrawDimensions",
                components: {
                    DimensionLine: xt
                },
                computed: n()({}, Object(a.e)({
                    type: function (t) {
                        return t.shape.type
                    }
                }), Object(a.c)({
                    shape: "shape/shape"
                }))
            },
            se = {
                name: "Draw",
                components: {
                    SvgRoot: ot,
                    Dimensions: Object(f.a)(ie, function () {
                        var t = this,
                            e = t.$createElement,
                            i = t._self._c || e;
                        return i("g", {
                            staticClass: "dimension-lines"
                        }, t._l(["horizontal", "vertical"], function (e) {
                            return "circle" !== t.type || "horizontal" === e ? i("DimensionLine", {
                                key: e,
                                staticClass: "dimension-lines__item",
                                attrs: {
                                    orientation: e,
                                    width: t.shape.width,
                                    height: t.shape.height,
                                    diameter: t.shape.diameter,
                                    side1: t.shape.side1,
                                    side2: t.shape.side2,
                                    type: t.type,
                                    radius: t.shape.radius
                                }
                            }) : t._e()
                        }))
                    }, [], !1, null, null, null).exports,
                    Shape: ee,
                    SVGPanZoom: st
                },
                computed: n()({}, Object(a.e)({
                    shapeType: function (t) {
                        return t.shape.type
                    }
                }), Object(a.c)({
                    shape: "shape/shape"
                }), {
                    width: function () {
                        switch (this.shapeType) {
                            case "rectangle":
                                return parseInt(this.shape.width, 10) + 50;
                            case "circle":
                                return parseInt(this.shape.diameter, 10);
                            case "triangle":
                                return parseInt(this.shape.side2, 10) + 50;
                            default:
                                return 0
                        }
                    },
                    height: function () {
                        var t = 0;
                        switch (this.shapeType) {
                            case "rectangle":
                                t = this.shape.height;
                                break;
                            case "circle":
                                t = this.shape.diameter;
                                break;
                            case "triangle":
                                t = this.shape.side1
                        }
                        return parseInt(t, 10) + 50
                    }
                })
            },
            ne = Object(f.a)(se, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("SVGPanZoom", [e("svg", {
                    staticClass: "draw",
                    attrs: {
                        xmlns: "http://www.w3.org/2000/svg",
                        viewBox: "0 0 " + this.width + " " + this.height,
                        width: "100%",
                        height: "100%",
                        version: "1.1"
                    }
                }, [e("g", {
                    staticClass: "draw__sketch"
                }, [e("Shape", {
                    staticClass: "draw__shape",
                    attrs: {
                        transform: "translate(1, 1)"
                    }
                }), this._v(" "), e("Dimensions", {
                    staticClass: "draw__dimensions"
                })], 1)])])
            }, [], !1, null, null, null).exports,
            ae = i("Zx67"),
            oe = i.n(ae),
            re = i("zwoO"),
            le = i.n(re),
            ce = i("Pf15"),
            ue = i.n(ce),
            he = i("wz9i"),
            de = function (t) {
                function e(t) {
                    Z()(this, e);
                    var i = le()(this, (e.__proto__ || oe()(e)).call(this));
                    return i.cutTypes = t, i
                }
                return ue()(e, t), X()(e, [{
                    key: "getOptionsList",
                    value: function () {
                        return this.cutTypes.map(function (t) {
                            var e = t.name;
                            return {
                                label: e,
                                value: e
                            }
                        })
                    }
                }, {
                    key: "getCutMaterialsIds",
                    value: function () {
                        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "",
                            e = this.cutTypes.find(function (e) {
                                return e.name === t
                            });
                        return e ? e.cutMaterialIds : []
                    }
                }]), e
            }(he.a),
            pe = i("lssa"),
            me = i.n(pe),
            fe = function (t) {
                function e(t) {
                    Z()(this, e);
                    var i = le()(this, (e.__proto__ || oe()(e)).call(this));
                    return i.cutMaterials = t, i
                }
                return ue()(e, t), X()(e, [{
                    key: "getOptionsList",
                    value: function () {
                        var t = this,
                            e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
                        return me()(e.map(function (e) {
                            var i = t.cutMaterials[e];
                            if (i) return {
                                label: i.name,
                                value: i.id
                            }
                        }))
                    }
                }, {
                    key: "getById",
                    value: function (t) {
                        return this.cutMaterials[t]
                    }
                }]), e
            }(he.a),
            _e = Object(r.a)({
                getterType: "shape/getField",
                mutationType: "shape/updateField"
            }).mapFields,
            ve = {
                name: "ConsturctorWrapper",
                components: {
                    Rectangle: It,
                    ConstructorCircle: Pt,
                    Triangle: Nt,
                    HolesList: jt,
                    Results: Lt,
                    HoleForm: Vt,
                    RemoveHoleModal: Ut,
                    ChShapeTypeModal: Yt,
                    ModifyShapeModal: Jt,
                    Draw: ne,
                    Button: _,
                    Icon: T,
                    FormItem: O,
                    Fieldset: k,
                    Input: R,
                    Select: j
                },
                data: function () {
                    return {
                        isSend: !1,
                        cost: null,
                        shapeType: this.type,
                        shapeId: null
                    }
                },
                computed: n()({}, _e(["type", "title", "quantity", "cutType", "material"]), Object(a.e)({
                    isHoleEditVisible: function (t) {
                        return t.holeEdit.visible
                    },
                    holeEditParams: function (t) {
                        return t.holeEdit.params
                    },
                    shape: function (t) {
                        return t.shape
                    },
                    cutTypesData: function (t) {
                        return t.settings.cutTypes
                    },
                    cutMaterialsData: function (t) {
                        return t.settings.cutMaterials
                    },
                    validation: function (t) {
                        return t.errors.validation
                    }
                }), Object(a.c)({
                    isRectangle: "shape/isRectangle",
                    isCircle: "shape/isCircle",
                    isTriangle: "shape/isTriangle",
                    isHaveHoles: "shape/isHaveHoles"
                }), {
                    cutTypes: function () {
                        return new de(this.cutTypesData)
                    },
                    cutMaterials: function () {
                        return new fe(this.cutMaterialsData)
                    },
                    cutTypesOptions: function () {
                        return this.cutTypes.getOptionsList().reverse()
                    },
                    cutMaterialsIds: function () {
                        return this.cutType ? this.cutTypes.getCutMaterialsIds(this.cutType) : []
                    },
                    /** TODO: Sort by thickness */
                    cutMaterialsOptions: function () {
                        return this.cutType ? this.cutMaterials.getOptionsList(this.cutMaterialsIds).sort() : []
                    }
                }),
                methods: n()({}, Object(a.d)({
                    removeAllHoles: "shape/" + Wt.e
                }), Object(a.b)({
                    saveShapeAction: "shape/" + o.k,
                    updateShapeAction: "shape/" + o.p,
                    calculateCostAction: "shape/" + o.c,
                    closeModal: l.POP,
                    openModal: l.PUSH,
                    holeEditClose: "holeEdit/" + o.e
                }), {
                    save: function () {
                        var t = this,
                            e = this.$route,
                            i = e.params,
                            s = e.name;
                        switch (this.isSend = !0, s) {
                            case "constructor/order":
                            case "constructor/new":
                                this.saveShapeAction().then(function () {
                                    t.isSend = !1
                                });
                                break;
                            case "constructor/edit":
                                i.id && (this.openModal({
                                    name: "modifyShape"
                                }), this.shapeId = i.id);
                                break;
                            default:
                                this.isSend = !1
                        }
                    },
                    caclulate: function () {
                        var t = this;
                        this.calculateCostAction().then(function (e) {
                            e && (t.cost = e.cost ? e.cost : null, t.$scrollTo("#results"))
                        })
                    },
                    onShapeTypeChange: function () {
                        this.isHaveHoles ? this.openModal({
                            name: "changeShape"
                        }) : this.type = this.shapeType
                    },
                    onCancelChangeShape: function () {
                        this.closeModal({
                            name: "changeShape"
                        }), this.type = this.shapeType
                    },
                    onSuccessChangeShape: function () {
                        this.removeAllHoles(), this.holeEditClose(), this.closeModal({
                            name: "changeShape"
                        }), this.type = this.shapeType
                    },
                    onCloseChangeShape: function () {
                        this.closeModal({
                            name: "changeShape"
                        }), this.shapeType = this.type
                    },
                    onSuccessModifyShape: function () {
                        var t = this;
                        this.updateShapeAction(this.shapeId).then(function () {
                            t.isSend = !1, t.closeModal({
                                name: "modifyShape"
                            })
                        })
                    },
                    onCloseModifyShape: function () {
                        this.isSend = !1, this.closeModal({
                            name: "modifyShape"
                        })
                    }
                })
            },
            ge = Object(f.a)(ve, function () {
                var t = this,
                    e = t.$createElement,
                    i = t._self._c || e;
                return i("div", {
                    staticClass: "constructor-wrapper"
                }, [i("div", {
                    staticClass: "constructor-wrapper__section"
                }, [i("div", {
                    staticClass: "constructor-wrapper__form"
                }, [i("div", {
                    staticClass: "constructor-wrapper__col"
                }, [i("div", {
                    staticClass: "constructor-wrapper__col-wrapper"
                }, [i("h2", {
                    staticClass: "constructor-wrapper__col-title"
                }, [t._v("Конфигурации детали:")]), t._v(" "), i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Название детали:",
                        errors: t.validation.title,
                        htmlFor: "shape.title"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "shape.title",
                        name: "title",
                        placeholder: "Название детали",
                        block: ""
                    },
                    model: {
                        value: t.title,
                        callback: function (e) {
                            t.title = e
                        },
                        expression: "title"
                    }
                })], 1), t._v(" "), i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Тип резки:",
                        errors: t.validation.cutType,
                        htmlFor: "shape.cutType"
                    }
                }, [i("Fieldset", [i("Select", {
                    attrs: {
                        options: t.cutTypesOptions,
                        placeholder: "Выберите тип резки",
                        id: "shape.cutType",
                        name: "cutType",
                        block: ""
                    },
                    model: {
                        value: t.cutType,
                        callback: function (e) {
                            t.cutType = e
                        },
                        expression: "cutType"
                    }
                })], 1)], 1), t._v(" "), i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Форма детали:",
                        errors: t.validation.type,
                        htmlFor: "shape.type"
                    }
                }, [i("Fieldset", [i("Select", {
                    attrs: {
                        options: [{
                            label: "Квадрат/Прямоугольник",
                            value: "rectangle"
                        }, {
                            label: "Круг",
                            value: "circle"
                        }, {
                            label: "Треугольник",
                            value: "triangle"
                        }],
                        //placeholder: "Выберите форму",
                        placeholder: "Квадрат/Прямоугольник",
                        id: "shape.type",
                        name: "type",
                        block: ""
                    },
                    on: {
                        change: t.onShapeTypeChange
                    },
                    model: {
                        value: t.shapeType,
                        callback: function (e) {
                            t.shapeType = e
                        },
                        expression: "shapeType"
                    }
                })], 1)], 1), t._v(" "), t.isRectangle ? i("Rectangle", {
                    staticClass: "form__item"
                }) : t._e(), t._v(" "), t.isCircle ? i("ConstructorCircle", {
                    staticClass: "form__item"
                }) : t._e(), t._v(" "), t.isTriangle ? i("Triangle", {
                    staticClass: "form__item"
                }) : t._e(), t._v(" "), i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Материал детали:",
                        errors: t.validation.material,
                        htmlFor: "shape.material"
                    }
                }, [i("Select", {
                    attrs: {
                        id: "shape.material",
                        name: "material",
                        options: t.cutMaterialsOptions,
                        placeholder: "Выберите материал",
                        disabled: t.cutMaterialsOptions.length <= 0,
                        resetOnOptionsChange: !0,
                        block: ""
                    },
                    model: {
                        value: t.material,
                        callback: function (e) {
                            t.material = e
                        },
                        expression: "material"
                    }
                })], 1), t._v(" "), i("FormItem", {
                    staticClass: "form__item",
                    attrs: {
                        label: "Количество деталей:",
                        errors: t.validation.quantity,
                        htmlFor: "shape.quantity"
                    }
                }, [i("Input", {
                    attrs: {
                        id: "shape.quantity",
                        name: "quantity",
                        type: "number",
                        placeholder: "Количество деталей",
                        min: 1,
                        icon: "form_quantity",
                        block: ""
                    },
                    model: {
                        value: t.quantity,
                        callback: function (e) {
                            t.quantity = e
                        },
                        expression: "quantity"
                    }
                })], 1)], 1)]), t._v(" "), i("div", {
                    staticClass: "constructor-wrapper__col"
                }, [i("div", {
                    staticClass: "constructor-wrapper__draft"
                }, [i("Draw")], 1), t._v(" "), i("div", {
                    staticClass: "constructor-wrapper__draft-controls"
                }, [i("div", {
                    staticClass: "constructor-wrapper__draft-controls-item"
                }, [i("Button", {
                    attrs: {
                        color: "orange",
                        size: "large",
                        theme: "gradient solid rounded bold uppercase letter-spacing",
                        icon: ""
                    },
                    on: {
                        click: t.caclulate
                    }
                }, [i("Icon", {
                    attrs: {
                        name: "calculator"
                    }
                }), t._v(" "), i("span", [t._v("Рассчитать стоимость")])], 1)], 1), t._v(" "), i("div", {
                    staticClass: "constructor-wrapper__draft-controls-item"
                }, [i("Button", {
                    attrs: {
                        disabled: t.isSend,
                        color: "blue",
                        theme: "transparent solid rounded",
                        icon: ""
                    },
                    on: {
                        click: t.save
                    }
                }, [i("Icon", {
                    attrs: {
                        name: "save"
                    }
                }), t._v(" "), i("span", [t._v("Сохранить деталь")])], 1)], 1)])]), t._v(" "), t.isHoleEditVisible ? i("div", {
                    staticClass: "constructor-wrapper__col"
                }, [i("HoleForm", {
                    attrs: {
                        id: t.holeEditParams.id
                    }
                })], 1) : i("div", {
                    staticClass: "constructor-wrapper__col"
                }, [t._m(0), t._v(" "), i("HolesList")], 1)])]), t._v(" "), i("div", {
                    staticClass: "constructor-wrapper__section",
                    attrs: {
                        id: "results"
                    }
                }, [t.cost ? i("div", {
                    staticClass: "constructor-wrapper__results"
                }, [i("h2", {
                    staticClass: "section-title"
                }, [t._v("Результат рассчета:")]), t._v(" "), i("Results", {
                    attrs: {
                        data: t.cost
                    }
                })], 1) : t._e()]), t._v(" "), i("RemoveHoleModal"), t._v(" "), i("ChShapeTypeModal", {
                    attrs: {
                        onSuccess: t.onSuccessChangeShape,
                        onCancel: t.onCancelChangeShape,
                        onClose: t.onCloseChangeShape
                    }
                }), t._v(" "), i("ModifyShapeModal", {
                    attrs: {
                        onSuccess: t.onSuccessModifyShape,
                        onCancel: t.onCloseModifyShape,
                        onClose: t.onCloseModifyShape,
                        shapeName: t.title
                    }
                })], 1)
            }, [function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    staticClass: "constructor-wrapper__col-wrapper"
                }, [e("h2", {
                    staticClass: "constructor-wrapper__col-title"
                }, [this._v("Отверстия:")])])
            }], !1, null, null, null).exports,
            be = {
                name: "ConstructorNew",
                components: {
                    ConstructorWrapper: ge
                },
                created: function () {
                    this.resetShape()
                },
                methods: n()({}, Object(a.b)({
                    resetShape: "shape/" + o.j
                }))
            },
            ye = Object(f.a)(be, function () {
                var t = this.$createElement;
                return (this._self._c || t)("ConstructorWrapper")
            }, [], !1, null, null, null).exports,
            Ce = {
                name: "ConstructorEdit",
                components: {
                    ConstructorWrapper: ge
                },
                watch: {
                    $route: function (t, e) {
                        t.params.id && e.params.id !== t.params.id && this.loadShape(t.params.id)
                    }
                },
                created: function () {
                    var t = this.$route.params;
                    t.id && this.loadShape(t.id)
                },
                methods: n()({}, Object(a.b)({
                    loadShape: "shape/" + o.h
                }))
            },
            Se = Object(f.a)(Ce, function () {
                var t = this.$createElement;
                return (this._self._c || t)("ConstructorWrapper")
            }, [], !1, null, null, null).exports,
            ke = {
                name: "ConstructorEditOrder",
                components: {
                    ConstructorWrapper: ge
                },
                watch: {
                    $route: function (t, e) {
                        t.params.id && e.params.id !== t.params.id && this.loadShapeOrder(t.params.id)
                    }
                },
                created: function () {
                    var t = this.$route.params;
                    t.id && this.loadShapeOrder(t.id)
                },
                methods: n()({}, Object(a.b)({
                    loadShapeOrder: "shape/" + o.i
                }))
            },
            we = Object(f.a)(ke, function () {
                var t = this.$createElement;
                return (this._self._c || t)("ConstructorWrapper")
            }, [], !1, null, null, null).exports;
        e.a = [{
            path: "/new",
            name: "constructor/new",
            component: ye
        }, {
            path: "/edit/:id",
            name: "constructor/edit",
            component: Se
        }, {
            path: "/order/:id",
            name: "constructor/order",
            component: we
        }, {
            path: "/",
            redirect: "/new"
        }, {
            path: "/*",
            redirect: "/new"
        }]
    },
    "Du/2": function (t, e, i) {
        "use strict";
        i.d(e, "d", function () {
            return s
        }), i.d(e, "f", function () {
            return n
        }), i.d(e, "e", function () {
            return a
        }), i.d(e, "m", function () {
            return o
        }), i.d(e, "k", function () {
            return r
        }), i.d(e, "g", function () {
            return l
        }), i.d(e, "c", function () {
            return c
        }), i.d(e, "a", function () {
            return u
        }), i.d(e, "b", function () {
            return h
        }), i.d(e, "j", function () {
            return d
        }), i.d(e, "i", function () {
            return p
        }), i.d(e, "l", function () {
            return m
        }), i.d(e, "h", function () {
            return f
        });
        var s = "PUSH_HOLE",
            n = "REMOVE_HOLE",
            a = "REMOVE_ALL_HOLES",
            o = "UPDATE_HOLE",
            r = "SET_SHAPE_STATE",
            l = "RESET_STATE",
            c = "HOLE_EDIT_SHOW",
            u = "HOLE_EDIT_HIDE",
            h = "HOLE_EDIT_SET_PARAMS",
            d = "SET_CUT_TYPES",
            p = "SET_CUT_MATERIALS",
            m = "SET_VALIDATION_ERRORS",
            f = "SET_CRITICAL_ERRORS"
    },
    IcnI: function (t, e, i) {
        "use strict";
        /**
         * @return {string}
         */
        var s, n, a, o, r, l, c, u = i("bOdI"),
            h = i.n(u),
            d = i("NYxO"),
            p = i("Fmw6"),
            m = (i("sax8"), i("fZjL")),
            f = i.n(m),
            _ = i("woOf"),
            v = i.n(_),
            g = i("7+uW"),
            b = i("ye7G"),
            y = i("Du/2"),
            C = i("+UIE"),
            S = i("oiih"),
            k = i("Qtl1"),
            w = i("Zx67"),
            x = i.n(w),
            O = i("Zrlr"),
            E = i.n(O),
            I = i("wxAW"),
            T = i.n(I),
            H = i("zwoO"),
            P = i.n(H),
            R = i("Pf15"),
            F = i.n(R),
            N = i("//Fk"),
            M = i.n(N),
            $ = function () {
                function t(e) {
                    var i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    E()(this, t), this.endpoint = e, this.parameters = i
                }
                return T()(t, [{
                    key: "setParameters",
                    value: function (t) {
                        var e = this;
                        return f()(t).forEach(function (i) {
                            e.parameters[i] = t[i]
                        }), this
                    }
                }, {
                    key: "setParameter",
                    value: function (t, e) {
                        return this.parameters[t] = e, this
                    }
                }, {
                    key: "removeParameters",
                    value: function (t) {
                        var e = this;
                        return t.forEach(function (t) {
                            delete e.parameters[t]
                        }), this
                    }
                }, {
                    key: "removeParameter",
                    value: function (t) {
                        return delete this.parameters[t], this
                    }
                }, {
                    key: "submit",
                    value: function (t, e) {
                        var i = this,
                            s = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                        return new M.a(function (n, a) {
                            g.default.$http[t](e + i.getParameterString(), s).then(function (t) {
                                n(t.data)
                            }).catch(function (t) {
                                var e = t.response;
                                e ? a(e.data) : a()
                            })
                        })
                    }
                }, {
                    key: "all",
                    value: function () {
                        return this.submit("get", "/" + this.endpoint)
                    }
                }, {
                    key: "find",
                    value: function (t) {
                        return this.submit("get", "/" + this.endpoint + "/" + t)
                    }
                }, {
                    key: "create",
                    value: function (t) {
                        return this.submit("post", "/" + this.endpoint, t)
                    }
                }, {
                    key: "update",
                    value: function (t, e) {
                        return this.submit("put", "/" + this.endpoint + "/" + t, e)
                    }
                }, {
                    key: "destroy",
                    value: function (t) {
                        return this.submit("delete", "/" + this.endpoint + "/" + t)
                    }
                }, {
                    key: "getParameterString",
                    value: function () {
                        var t = this,
                            e = f()(this.parameters).filter(function (e) {
                                return !!t.parameters[e]
                            }).map(function (e) {
                                return e + "=" + t.parameters[e]
                            });
                        return 0 === e.length ? "" : "?" + e.join("&")
                    }
                }]), t
            }(),
            j = function (t) {
                function e() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return E()(this, e), P()(this, (e.__proto__ || x()(e)).call(this, "/constructor", t))
                }
                return F()(e, t), T()(e, [{
                    key: "save",
                    value: function (t) {
                        return this.submit("post", this.endpoint + "/save", {
                            shape: t
                        })
                    }
                }, {
                    key: "cost",
                    value: function (t) {
                        return this.submit("post", this.endpoint + "/cost", {
                            shape: t
                        })
                    }
                }, {
                    key: "addToCart",
                    value: function (t) {
                        return this.submit("post", this.endpoint + "/add_to_cart", {
                            shape: t
                        })
                    }
                }, {
                    key: "getById",
                    value: function (t) {
                        return this.submit("get", this.endpoint + "/shape/" + t)
                    }
                }, {
                    key: "update",
                    value: function (t, e) {
                        return this.submit("put", this.endpoint + "/shape/" + t, {
                            shape: e
                        })
                    }
                }]), e
            }($),
            A = function (t) {
                function e() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return E()(this, e), P()(this, (e.__proto__ || x()(e)).call(this, "/constructor", t))
                }
                return F()(e, t), T()(e, [{
                    key: "getById",
                    value: function (t) {
                        return this.submit("get", this.endpoint + "/order_shape/" + t)
                    }
                }, {
                    key: "update",
                    value: function (t, e) {
                        return this.submit("put", this.endpoint + "/order_shape/" + t, {
                            shape: e
                        })
                    }
                }]), e
            }($),
            L = {
                type: "rectangle",
                title: set_date(),
                material: "",
                cutType: "",
                quantity: 1,
                circle: {
                    diameter: "300"
                },
                rectangle: {
                    width: "300",
                    height: "300",
                    radius: "0"
                },
                triangle: {
                    side1: "300",
                    side2: "300"
                },
                holes: {}
            },
            B = (s = {
                updateField: b.c
            }, h()(s, y.d, function (t, e) {
                g.default.set(t.holes, e.id, e)
            }), h()(s, y.f, function (t, e) {
                g.default.delete(t.holes, e)
            }), h()(s, y.m, function (t, e) {
                var i = e.id,
                    s = e.data;
                g.default.set(t.holes, i, s)
            }), h()(s, y.e, function (t) {
                t.holes = {}
            }), h()(s, y.g, function (t) {
                v()(t, L)
            }), s),
            D = (n = {}, h()(n, C.n, function (t, e) {
                var i = t.dispatch;
                return e && e.message ? i("errors/" + C.l, [{
                    type: "critical",
                    message: e.message
                }], {
                    root: !0
                }) : e
            }), h()(n, C.o, function (t, e) {
                var i = t.dispatch;
                return e && e.errors ? i("errors/" + C.l, e.errors, {
                    root: !0
                }) : e
            }), h()(n, C.a, function (t) {
                var e = t.commit,
                    i = function (t) {
                        return {
                            id: t,
                            type: "circle",
                            position: {
                                zeroPoint: {
                                    rectangle: "top-left",
                                    triangle: "bottom-left",
                                    circle: "center",
                                    hole: "center"
                                },
                                x: "50",
                                y: "50",
                                l: "0",
                                angle: "0"
                            },
                            width: "40",
                            height: "40",
                            radius: "0",
                            diameter: "40",
                            isHovered: !1
                        }
                    }("_" + Object(k.a)());
                return e(y.d, i), i
            }), h()(n, C.k, function (t) {
                var e = t.dispatch,
                    i = t.state;
                return e("errors/" + C.d, null, {
                    root: !0
                }), (new j).save(i).then(function (t) {
                    if (t.shape) {
                        var e = parseInt(t.shape.id, 10);
                        e && (g.default.router.push("/edit/" + e), g.default.notification.show(S.m, {
                            className: "notification_type_success",
                            delay: S.j
                        }))
                    }
                    return t
                }, function (t) {
                    return e("SHOW_RESPONCE_ERRORS", t)
                }).catch(function (t) {
                    return e("SHOW_FATAL_ERROR", t)
                })
            }), h()(n, C.p, function (t, e) {
                var i = t.dispatch,
                    s = t.state;
                return i("errors/" + C.d, null, {
                    root: !0
                }), (new j).update(e, s).then(function (t) {
                    return t.shape && g.default.notification.show(S.m, {
                        className: "notification_type_success",
                        delay: S.j
                    }), t
                }, function (t) {
                    return i("SHOW_RESPONCE_ERRORS", t)
                }).catch(function (t) {
                    return i("SHOW_FATAL_ERROR", t)
                })
            }), h()(n, C.c, function (t) {
                var e = t.dispatch,
                    i = t.state;
                return e("errors/" + C.d, null, {
                    root: !0
                }), (new j).cost(i).then(function (t) {
                    return t
                }, function (t) {
                    return e("SHOW_RESPONCE_ERRORS", t)
                }).catch(function (t) {
                    return e("SHOW_FATAL_ERROR", t)
                })
            }), h()(n, C.b, function (t) {
                var e = t.dispatch,
                    i = t.state;
                return e("errors/" + C.d, null, {
                    root: !0
                }), (new j).addToCart(i).then(function (t) {
                    return t.success && t.success.redirectTo && (window.location.href = "", window.location = t.success.redirectTo), t
                }, function (t) {
                    return e("SHOW_RESPONCE_ERRORS", t)
                }).catch(function (t) {
                    return e("SHOW_FATAL_ERROR", t)
                })
            }), h()(n, C.h, function (t, e) {
                var i = t.dispatch,
                    s = t.commit;
                return i("errors/" + C.d, null, {
                    root: !0
                }), (new j).getById(e).then(function (t) {
                    return t.shape && s(y.k, t.shape, {
                        root: !0
                    }), t
                }, function (t) {
                    return i("SHOW_RESPONCE_ERRORS", t)
                }).catch(function (t) {
                    return i("SHOW_FATAL_ERROR", t)
                })
            }), h()(n, C.i, function (t, e) {
                var i = t.dispatch,
                    s = t.commit;
                return i("errors/" + C.d, null, {
                    root: !0
                }), (new A).getById(e).then(function (t) {
                    return t.shape && s(y.k, t.shape, {
                        root: !0
                    }), t
                }, function (t) {
                    return i("SHOW_RESPONCE_ERRORS", t)
                }).catch(function (t) {
                    return i("SHOW_FATAL_ERROR", t)
                })
            }), h()(n, C.q, function (t, e) {
                var i = t.dispatch,
                    s = t.state;
                return i("errors/" + C.d, null, {
                    root: !0
                }), (new A).update(e, s).then(function (t) {
                    return t.shape && g.default.notification.show(S.k, {
                        className: "notification_type_success",
                        delay: S.j
                    }), t
                }, function (t) {
                    return i("SHOW_RESPONCE_ERRORS", t)
                }).catch(function (t) {
                    return i("SHOW_FATAL_ERROR", t)
                })
            }), h()(n, C.j, function (t) {
                (0, t.commit)(y.g)
            }), n),
            W = {
                namespaced: !0,
                state: function () {
                    return L
                },
                mutations: B,
                getters: {
                    getField: b.b,
                    shape: function (t) {
                        return t[t.type]
                    },
                    isHaveHoles: function (t) {
                        return f()(t.holes).length > 0
                    },
                    getHoleById: function (t) {
                        return function (e) {
                            return t.holes[e]
                        }
                    },
                    getHolesAllIds: function (t) {
                        return f()(t.holes)
                    },
                    isRectangle: function (t) {
                        return "rectangle" === t.type
                    },
                    isCircle: function (t) {
                        return "circle" === t.type
                    },
                    isTriangle: function (t) {
                        return "triangle" === t.type
                    }
                },
                actions: D
            },
            z = {
                visible: !1,
                params: {}
            },
            q = {
                namespaced: !0,
                state: function () {
                    return z
                },
                mutations: (a = {
                    updateField: b.c
                }, h()(a, y.c, function (t) {
                    t.visible = !0
                }), h()(a, y.a, function (t) {
                    t.visible = !1
                }), h()(a, y.b, function (t, e) {
                    t.params = e
                }), a),
                getters: {
                    getField: b.b
                },
                actions: (o = {}, h()(o, C.f, function (t, e) {
                    var i = t.commit;
                    i(y.b, e), i(y.c)
                }), h()(o, C.e, function (t) {
                    var e = t.commit;
                    e(y.a), e(y.b, {})
                }), o)
            },
            V = i("wz9i"),
            Z = function (t) {
                function e() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    E()(this, e);
                    var i = P()(this, (e.__proto__ || x()(e)).call(this));
                    return i.settings = t, i
                }
                return F()(e, t), T()(e, [{
                    key: "getCutTypes",
                    value: function () {
                        return this.settings.cutTypes || {}
                    }
                }, {
                    key: "getCutMaterials",
                    value: function () {
                        return this.settings.cutMaterials || {}
                    }
                }]), e
            }(V.a),
            U = function (t) {
                function e() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return E()(this, e), P()(this, (e.__proto__ || x()(e)).call(this, "/constructor/info", t))
                }
                return F()(e, t), T()(e, [{
                    key: "load",
                    value: function () {
                        return this.submit("get", this.endpoint)
                    }
                }]), e
            }($),
            X = {
                cutTypes: [],
                cutMaterials: {}
            },
            Y = {
                namespaced: !0,
                state: function () {
                    return X
                },
                mutations: (r = {
                    updateField: b.c
                }, h()(r, y.j, function (t, e) {
                    t.cutTypes = e
                }), h()(r, y.i, function (t, e) {
                    t.cutMaterials = e
                }), r),
                getters: {
                    getField: b.b
                },
                actions: h()({}, C.g, function (t) {
                    var e = t.commit;
                    return (new U).load().then(function (t) {
                        var i = new Z(t);
                        return e(y.j, i.getCutTypes()), e(y.i, i.getCutMaterials()), t
                    })
                })
            },
            G = function () {
                var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                    e = arguments[1];
                if (!Array.isArray(t)) throw new Error("First argument should be array");
                return t.reduce(function (t, i) {
                    var s = i[e];
                    return t[s] = t[s] || [], t[s].push(i), t
                }, {})
            },
            J = function (t) {
                function e() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
                    E()(this, e);
                    var i = P()(this, (e.__proto__ || x()(e)).call(this));
                    return i.errors = t, i
                }
                return F()(e, t), T()(e, [{
                    key: "byType",
                    value: function () {
                        return G(this.errors, "type")
                    }
                }, {
                    key: "getCritical",
                    value: function () {
                        return this.byType().critical || []
                    }
                }, {
                    key: "getValidation",
                    value: function () {
                        return G(this.byType().validation, "source") || {}
                    }
                }]), e
            }(V.a),
            Q = {
                validation: {},
                critical: []
            },
            K = {
                namespaced: !0,
                state: function () {
                    return Q
                },
                mutations: (l = {
                    updateField: b.c
                }, h()(l, y.l, function (t, e) {
                    t.validation = e
                }), h()(l, y.h, function (t, e) {
                    t.critical = e
                }), l),
                getters: {
                    getField: b.b
                },
                actions: (c = {}, h()(c, C.l, function (t, e) {
                    var i = t.commit,
                        s = t.dispatch;
                    if (e) {
                        var n = new J(e),
                            a = n.getCritical(),
                            o = n.getValidation();
                        i(y.l, o), i(y.h, a), a.length > 0 && s(C.m)
                    }
                }), h()(c, C.m, function (t) {
                    var e = t.state,
                        i = t.commit,
                        s = S.c;
                    return e.critical.map(function (t, n) {
                        return g.default.notification.show(t.message, {
                            className: "notification_type_error",
                            delay: s,
                            afterClose: function () {
                                var t = e.critical.filter(function (t, e) {
                                    return e !== n
                                });
                                i(y.h, t)
                            }
                        })
                    })
                }), h()(c, C.d, function (t) {
                    (0, t.commit)(y.l, [])
                }), c)
            },
            tt = h()({}, y.k, function (t, e) {
                t.shape = e
            }),
            et = new d.a.Store({
                getters: {
                    materialLimits: function (t) {
                        return t.settings.cutMaterials[t.shape.material] || {
                            width: {
                                max: 3e3,
                                min: 1
                            },
                            height: {
                                max: 1500,
                                min: 1
                            },
                            holeSize: {
                                min: 1
                            }
                        }
                    }
                },
                mutations: tt,
                modules: {
                    shape: W,
                    holeEdit: q,
                    settings: Y,
                    errors: K,
                    modal: p.modalModule
                },
                strict: !1,
                plugins: []
            });
        e.a = et
    },
    JznP: function (t, e) {},
    NHnr: function (t, e, i) {
        "use strict";
        Object.defineProperty(e, "__esModule", {
            value: !0
        });
        var s = i("7+uW"),
            n = i("NYxO");
        s.default.use(n.a);
        var a = i("//Fk"),
            o = i.n(a),
            r = i("mtWM"),
            l = i.n(r),
            c = i("IcnI");
        l.a.defaults.baseURL = "", l.a.defaults.headers.common.Accept = "application/json", l.a.interceptors.response.use(function (t) {
            return t
        }, function (t) {
            return 401 === t.response.status && c.a.dispatch("auth/logout"), o.a.reject(t)
        }), s.default.$http = l.a, Object.defineProperty(s.default.prototype, "$http", {
            get: function () {
                return l.a
            }
        });
        var u = i("sSws"),
            h = i("9JMe");
        i.n(h).a.sync(c.a, u.a);
        var d = i("Dd8w"),
            p = i.n(d),
            m = i("woOf"),
            f = i.n(m),
            _ = i("Zrlr"),
            v = i.n(_),
            g = i("wxAW"),
            b = i.n(g),
            y = i("BO1k"),
            C = i.n(y),
            S = function (t, e) {
                for (var i = arguments.length, s = Array(i > 2 ? i - 2 : 0), n = 2; n < i; n++) s[n - 2] = arguments[n];
                if (t.constructor === Function) return t(e);
                var a = document.createElement(t);
                for (var o in e || {}) /^on/.test(o) ? a.addEventListener(o.substring(2).toLowerCase(), e[o]) : a[o] = e[o];
                var r = !0,
                    l = !1,
                    c = void 0;
                try {
                    for (var u, h = C()(s || []); !(r = (u = h.next()).done); r = !0) {
                        var d = u.value;
                        d && (d.constructor === String && (d = document.createTextNode(d)), a.appendChild(d))
                    }
                } catch (t) {
                    l = !0, c = t
                } finally {
                    try {
                        !r && h.return && h.return()
                    } finally {
                        if (l) throw c
                    }
                }
                return a
            },
            k = {
                animation: "animationend",
                WebkitAnimation: "webkitAnimationEnd",
                MozAnimation: "animationend",
                OAnimation: "oanimationend",
                msAnimation: "MSAnimationEnd"
            },
            w = function (t) {
                var e = document.createElement("span");
                for (var i in t)
                    if (void 0 !== e.style[i]) return t[i];
                return !1
            },
            x = function () {
                function t(e) {
                    v()(this, t), this.name = "notificationItem", this.container = e, this.defaults = {
                        delay: 3e3,
                        close: !0,
                        className: "",
                        containerClassName: "notification",
                        disappearClassName: "notification_disappear",
                        closeClassName: "notification__close",
                        messageClassName: "notification__message",
                        afterClose: function () {}
                    }, this.options = f()({}, this.defaults), this.init()
                }
                return b()(t, [{
                    key: "init",
                    value: function () {
                        this.animationEnd = w(k)
                    }
                }, {
                    key: "build",
                    value: function (t, e) {
                        var i = this,
                            s = null;
                        e.close && (s = S("button", {
                            className: this.defaults.closeClassName,
                            type: "button"
                        }));
                        var n = S("div", {
                            className: this.defaults.containerClassName + " " + e.className
                        }, s, S("div", {
                            className: this.defaults.messageClassName
                        }, t));
                        return this.notification = n, s && s.addEventListener("click", function () {
                            i.hide()
                        }), n
                    }
                }, {
                    key: "callback",
                    value: function (t) {
                        var e = this.options[t];
                        "function" == typeof e && e.call(this.element)
                    }
                }, {
                    key: "show",
                    value: function (t, e) {
                        var i = p()({}, this.defaults, e);
                        this.options = i;
                        var s = this.build(t, i);
                        return this.element = s, s
                    }
                }, {
                    key: "hide",
                    value: function () {
                        var t = this,
                            e = this;
                        this.element.classList.add(this.defaults.disappearClassName), this.element.addEventListener(this.animationEnd, function (i) {
                            i.target === t.element && (t.container.removeChild(t.element), e.callback("afterClose"))
                        })
                    }
                }]), t
            }(),
            O = function () {
                function t() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    v()(this, t), this.notifications = [], this.name = "notification", this.defaults = {
                        delay: 3e3,
                        containerClassName: "notification-container",
                        containerItemClassName: "notification-container__item"
                    }, this.options = f()({}, this.defaults, e), this.init()
                }
                return b()(t, [{
                    key: "init",
                    value: function () {
                        this.container = this.createNotificationContainer()
                    }
                }, {
                    key: "createNotificationContainer",
                    value: function () {
                        var t = S("div", {
                            className: this.options.containerClassName
                        });
                        return document.body.appendChild(t), t
                    }
                }, {
                    key: "close",
                    value: function (t) {
                        t.hide();
                        var e = this.notifications.indexOf(t);
                        this.notifications.splice(e, 1)
                    }
                }, {
                    key: "show",
                    value: function (t, e) {
                        var i = this,
                            s = p()({
                                delay: this.options.delay
                            }, e),
                            n = new x(this.container),
                            a = n.show(t, p()({}, s, {
                                className: s.className + " " + this.options.containerItemClassName
                            }));
                        this.container.appendChild(a), this.notifications.push(a), setTimeout(function () {
                            i.close(n)
                        }, s.delay)
                    }
                }]), t
            }(),
            E = {
                install: function (t, e) {
                    var i = new O(e);
                    t.prototype.$notification = i, t.notification = i
                }
            };
        "undefined" != typeof window && window.Vue && (window.Notification = E);
        var I = E;
        s.default.use(I);
        var T = i("T+v0"),
            H = i.n(T);
        s.default.use(H.a), s.default.filter("currency", function (t) {
            var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    decimal: 0,
                    separator: " ",
                    after: "",
                    before: ""
                },
                i = parseFloat(t).toFixed(e.decimal).replace(".", ",").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1" + e.separator);
            return e.before + i + e.after
        }), s.default.filter("pluralize", function (t, e, i, s) {
            var n = parseInt(t, 10);
            return n + " " + function (t, e, i, s) {
                var n = Math.abs(t);
                return (n %= 100) >= 5 && n <= 20 ? s : 1 == (n %= 10) ? e : n >= 2 && n <= 4 ? i : s
            }(n, e, i, s)
        });
        var P = i("bm7V"),
            R = i.n(P);
        s.default.use(R.a);
        i("cS6N");
        var F = {
                name: "App"
            },
            N = i("K1/g"),
            M = Object(N.a)(F, function () {
                var t = this.$createElement,
                    e = this._self._c || t;
                return e("div", {
                    attrs: {
                        id: "app"
                    }
                }, [e("router-view")], 1)
            }, [], !1, null, null, null).exports,
            $ = i("+UIE");
        s.default.config.productionTip = !1, c.a.dispatch("settings/" + $.g), new s.default({
            el: "#constructor",
            router: u.a,
            store: c.a,
            render: function (t) {
                return t(M)
            }
        })
    },
    Qtl1: function (t, e, i) {
        "use strict";
        var s = i("eXoM"),
            n = i.n(s);
        e.a = function () {
            return n()("_0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 21)
        }
    },
    RmpG: function (t, e, i) {
        "use strict";
        var s = i("4Sls");
        i.n(s).a
    },
    aMhk: function (t, e) {},
    cS6N: function (t, e) {},
    kk1Z: function (t, e, i) {
        "use strict";
        var s = i("ynPq");
        i.n(s).a
    },
    oPwn: function (t, e, i) {
        "use strict";
        var s = i("1SJ1");
        i.n(s).a
    },
    oiih: function (t, e, i) {
        "use strict";
        i.d(e, "l", function () {
            return s
        }), i.d(e, "h", function () {
            return n
        }), i.d(e, "g", function () {
            return a
        }), i.d(e, "i", function () {
            return o
        }), i.d(e, "e", function () {
            return r
        }), i.d(e, "d", function () {
            return l
        }), i.d(e, "f", function () {
            return c
        }), i.d(e, "b", function () {
            return u
        }), i.d(e, "a", function () {
            return h
        }), i.d(e, "j", function () {
            return d
        }), i.d(e, "c", function () {
            return p
        }), i.d(e, "n", function () {
            return m
        }), i.d(e, "m", function () {
            return f
        }), i.d(e, "k", function () {
            return _
        });
        var s = "\n  fill: #f7fafd;\n  stroke-width: 1px;\n  stroke: #c6ced8;\n",
            n = "#bdc7d3",
            a = "#0094ff",
            o = "#f43535",
            r = 48,
            l = "#4c5e70",
            c = "\n  font-family: inherit;\n  font-size: 1em;\n  color: #001a33;\n",
            u = [
                [3.5, 0],
                [7, 7],
                [0, 7]
            ],
            h = 7,
            d = 4e3,
            p = 1e4,
            m = "/static/assets/images/icons.svg",
            f = "Деталь успешно сохранена",
            _ = "Заказ успешно сохранен"
    },
    qQOt: function (t, e) {},
    qzXf: function (t, e, i) {
        "use strict";
        var s = i("JznP");
        i.n(s).a
    },
    sSws: function (t, e, i) {
        "use strict";
        (function (t) {
            i.d(e, "a", function () {
                return r
            });
            var s = i("7+uW"),
                n = i("/ocq"),
                a = i("DP/h"),
                o = i("IcnI");
            s.default.use(n.a);
            var r = new n.a({
                mode: "hash",
                base: t,
                routes: a.a
            });
            r.beforeEach(function (t, e, i) {
                t.matched.some(function (t) {
                    return t.meta.auth
                }) && !o.a.state.auth.authenticated ? i({
                    name: "login.index"
                }) : t.matched.some(function (t) {
                    return t.meta.guest
                }) && o.a.state.auth.authenticated ? i({
                    name: "home.index"
                }) : i()
            }), s.default.router = r
        }).call(e, "/")
    },
    wm2O: function (t, e, i) {
        "use strict";
        var s = i("qQOt");
        i.n(s).a
    },
    wz9i: function (t, e, i) {
        "use strict";
        var s = i("Zrlr"),
            n = i.n(s),
            a = i("wxAW"),
            o = i.n(a),
            r = function () {
                function t() {
                    n()(this, t)
                }
                return o()(t, null, [{
                    key: "fetchCollection",
                    value: function (t) {
                        var e = this;
                        return t.map(function (t) {
                            return e.fetch(t)
                        })
                    }
                }, {
                    key: "sendCollection",
                    value: function (t) {
                        var e = this;
                        return t.map(function (t) {
                            return e.send(t)
                        })
                    }
                }]), t
            }();
        e.a = r
    },
    ynPq: function (t, e) {},
    zgxX: function (t, e, i) {
        "use strict";
        var s = i("aMhk");
        i.n(s).a
    }
}, ["NHnr"]);
//# sourceMappingURL=app.a69d5ccf09607feb99f2.js.map