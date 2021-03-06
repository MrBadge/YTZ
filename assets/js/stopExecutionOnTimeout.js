"use strict";
"object" != typeof window.CP && (window.CP = {}), window.CP.PenTimer = {
    programStartTime: 0,
    stopAllMonitoring: !1,
    STOP_ALL_MONITORING_TIMEOUT: 2e3,
    fps: null,
    interval: 100,
    lastLoop: 0,
    thisLoop: null,
    MIN_FPS: 5,
    MIN_FPS_WHEN_TAB_HIDDEN: .5,
    MAX_TIMES_BELOW_MIN_FPS: 15,
    LAST_FPS_UPDATE_TIMEOUT: 200,
    timesBelowMinFPS: 0,
    programKilledSoStopMonitoring: !1,
    init: function() {
        return this.programStartTime = this._getTime(), "undefined" != typeof __pageType && "pen" === __pageType ? 0 : void this.tickFPS()
    },
    shouldStopLoop: function(i) {
        if (this.stopAllMonitoring)
            return !1;
        if (this.programKilledSoStopMonitoring)
            return !0;
        var t = this._shouldStopLoop(i);
        if (t)
            throw this.programKilledSoStopMonitoring=!0, "We've detected what seems like an infinite loop in your JavaScript. To prevent your browser from crashing, we've stopped it.";
        return t
    },
    _shouldStopLoop: function() {
        var i = this._getTime();
        return this._programExceededMonitoringTimeLimit(i) ? (this.stopAllMonitoring=!0, !1) : this._programExceededUpdateFPSTimeLimit(i)?!0 : this.timesBelowMinFPS > this.MAX_TIMES_BELOW_MIN_FPS?!0 : !1
    },
    _programExceededMonitoringTimeLimit: function(i) {
        return i - this.programStartTime > this.STOP_ALL_MONITORING_TIMEOUT
    },
    _programExceededUpdateFPSTimeLimit: function(i) {
        var t = i - this.thisLoop;
        return t > this.LAST_FPS_UPDATE_TIMEOUT
    },
    tickFPS: function() {
        return this._calcAndSaveFPSValues(), this._programExceededMonitoringTimeLimit(this.thisLoop) ? (this.stopAllMonitoring=!0, !1) : (this.fps < this._getMinFPS() ? this.timesBelowMinFPS += 1 : this.timesBelowMinFPS = 0, void(this.programKilledSoStopMonitoring || this.stopAllMonitoring || setTimeout(function() {
            window.CP.PenTimer.tickFPS()
        }, this.interval)))
    },
    _calcAndSaveFPSValues: function() {
        this.thisLoop = this._getTime(), this.fps = (1e3 / (this.thisLoop - this.lastLoop)).toFixed(1), this.lastLoop = this.thisLoop
    },
    _getMinFPS: function() {
        return "boolean" == typeof document.hidden && document.hidden ? this.MIN_FPS_WHEN_TAB_HIDDEN : this.MIN_FPS
    },
    _getTime: function() {
        return + new Date
    }
}, window.CP.shouldStopExecution = function(i) {
    return window.CP.PenTimer.shouldStopLoop(i)
}, window.CP.stopExecutionOnTimeout = function() {
    return !1
}, window.CP.PenTimer.init();

