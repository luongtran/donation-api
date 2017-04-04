module DashboardHelper
  def label_class_for(role)
    {
      :admin => 'label-danger',
      :user => 'label-primary',
      :customer => 'label-warning',
      :editor => 'label-success',
      :twitter => 'label-success',
      :facebook => 'label-primary',
      :email => 'label-default'
    }[role.to_sym] || role.to_s
  end
end
