# name: discourse-per-user-css
# about: Allows users to customize their own interface using CSS
# version: 0.0.1
# authors: NateDhaliwal
# url: https://github.com/NateDhaliwal/discourse-per-user-css

register_editable_user_custom_field :user_css_code
DiscoursePluginRegistry.serialized_current_user_fields << 'user_css_code'

after_initialize do
  User.register_custom_field_type('user_css_code', :string)
  add_to_serializer(:user, :user_css_code) { object.user_css_code }
end
