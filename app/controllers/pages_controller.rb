class PagesController < ApplicationController
  skip_before_filter :require_log_in
end
