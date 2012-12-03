module Admin::PermissionsHelper
  def permissions
    {
      "view" => "View"
    }
  end

  def perm_checked(name, project)
    @ability.can?(name.to_sym, project) ? "checked" : "false"
  end
end
