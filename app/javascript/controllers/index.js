// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import NavbarSliderController from "./navbar_slider_controller"
application.register("navbar-slider", NavbarSliderController)

import InsertInCalendarController from "./insert_in_calendar_controller"
application.register("insert-in-calendar", InsertInCalendarController)

import SliderController from "./slider_controller"
application.register("slider", SliderController)

import SyncController from "./sync_controller"
application.register("sync", SyncController)

import TypedJsController from "./typed_js_controller"
application.register("typed-js", TypedJsController)
