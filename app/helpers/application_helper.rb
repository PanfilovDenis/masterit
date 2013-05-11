module ApplicationHelper
  def current_estimation(work)
    work.estimations.where("expert_id = ?", current_user.id).first
  end
  def plagiat(work, user)
    user.plagiat_details.where("work_id = ?", work.id).first.id
  end
  def moderator_has_region?(moderator, region)
    moderator.id == region.moderator_id
  end
  def progress_value(estimation_value)
    value = estimation_value / 10.0 * 100
    value.to_i
  end
  def not_in_basket?(expert, work)
    return true if expert.basket.nil?
    works = expert.basket.works
    works.map(&:id).exclude?(work.id)
  end
  def not_belongs_to_expert?(expert, nomination)
    return true if expert.basket.nil?
    works = expert.basket.works.map(&:id)
    nomination_works = nomination.works.map(&:id)
    nomination_works.each {|work| return true if works.exclude? work}
    return false
  end
  def item(tag, name, path, link_options = {})
    options = {}
    options[:class] = :active if current_page?(path)
    link = link_to(name, path, link_options)
    content_tag(:li, link, options)
  end

  def model_item(tag, model, path, options = {})
    item(tag, model.model_name.human, path, options)
  end
  
  def union_item(tag, name, path, options ={})
    new_name = "#{content_tag(:i, '', class: 'icon-chevron-right')} #{name}".html_safe
    item(tag, new_name, path, options)
  end
  
  def show_tree(arrange_hash, &block)
    return if arrange_hash.empty?
    content_tag "ul type='none'" do
      items = arrange_hash.map do |item, children|
        content_tag "li type='none'" do
          html = capture item, &block
          subtree = show_tree(children, &block)
          [html, subtree].compact.map!(&:to_s).join.html_safe
        end
      end
      items.join.html_safe
    end
  end

  def nav_menu_items_arrange
    MenuItem.published_arrange(2)
  end

  def current_competition
    Competition.find_by_year Time.current.year
  end
end
