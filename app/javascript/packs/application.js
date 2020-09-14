require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// DataTable
import "datatables.net-bs4";
import "datatables.net-responsive-bs4";
import "datatables.net-select-bs4";
import { dataTable } from "../packs/datatable";

// Stimulus
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
const application = Application.start();
const context = require.context("./controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

// functions
dataTable();
