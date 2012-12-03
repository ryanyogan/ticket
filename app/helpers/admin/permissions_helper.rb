module Admin::PermissionsHelper
  def permissions
    {
      "view" => "View",
      "create tickets" => "Create Tickets",
      "edit tickets" => "Edit Tickets",
      "delete tickets" => "Delete Tickets"
    }
  end

  def perm_checked(name, project)
    @ability.can?(name.to_sym, project) ? "checked" : "false"
  end
end
