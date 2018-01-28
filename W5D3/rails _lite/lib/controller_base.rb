require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, route_params)
    debugger
    @req = req 
    @res = res
    route_params.names.each do |key|
      @params[key] = route_params[key]
    end
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    return true if @already_built_response
    false
  end

  # Set the response status code and header
  def redirect_to(url)
    @res.header['Location'] = url
    @res.status = 302
    @already_built_response = true
    @session.store_session(@res) if @session #setting session cookie
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    @res['Content-Type'] = content_type
    @already_built_response = true
    @session.store_session(@res) if @session #setting session cookie
    @res.write(content)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    # debugger
    controller_name = self.class.to_s.underscore
    file_link = "views/#{controller_name}/#{template_name}.html.erb"
    all_file_lines = File.read(file_link)
    template = ERB.new(all_file_lines).result(binding)
    raise "You already render/redirect" if already_built_response?
    render_content(template, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
  end
end

