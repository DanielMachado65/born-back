# frozen_string_literal: true

# main controller
class Api::V1::ApiController < ActionController::Base
  # Login
  def require_auth_token
    authenticate_token || api_forbidden(error: 'Acesso negado')
  end

  def current_user
    @current_user ||= authenticate_token
  end

  protected

  # --------------------------- login
  def authenticate_token
    bearer_token
    User.find_by(auth_token: @bearer_token) unless @bearer_token.nil?
  end

  def bearer_token
    pattern = /^Bearer /
    header = request.headers['Authorization']
    @bearer_token = header.gsub(pattern, '') if header&.match(pattern)
  end

  # HACK: in this filter you have a scope on model
  def apply_filters(objects, *scopes)
    scopes.each do |scope|
      param_name = scope.to_s.sub('by_', '')
      next unless params[param_name] && objects.respond_to?(scope)

      objects =
        if params[param_name].to_s != 'true' && params[param_name].to_s != 'false'
          objects.send(scope, params[param_name])
        else
          objects.send(scope)
        end
    end

    objects
  end
end
