class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document

  private

  def build_footer
    div :id => "footer" do
      para "CS5322: Edwin Boaz Soenaryo, Yang Yuhang, Yao Jinyi - powered by #{link_to('Active Admin', 'http://www.activeadmin.info')} #{ActiveAdmin::VERSION}".html_safe
    end
  end

end