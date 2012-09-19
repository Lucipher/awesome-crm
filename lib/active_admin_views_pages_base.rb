class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document

  private

  def build_footer
    div :id => "footer" do
      para "CS5322: Edwin Boaz Soenaryo, Yang Yuhang, Yao Jinyi"
    end
  end

end