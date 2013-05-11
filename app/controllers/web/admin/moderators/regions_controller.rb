class Web::Admin::Moderators::RegionsController < Web::Admin::Moderators::ApplicationController
  def index
    @moderator = User.find_by_id params[:moderator_id]
    @q = Region.ransack params[:q]
    @regions = @q.result.page(params[:page])
    respond_with @regions, location: admin_moderator_regions_path(moderator_id: params[:moderator_id])
  end

  def remove_region_from_moderator
    @q = Region.ransack params[:q]
    @regions = @q.result.page(params[:page])
    @moderator = User.find params[:moderator_id]
    @moderator.region = nil
    @moderator.save
    respond_with @regions, location: admin_moderator_regions_path(moderator_id: params[:moderator_id])
  end

  def set_region_to_moderator
    @q = Region.ransack params[:q]
    @moderator = User.find params[:moderator_id]
    @regions = @q.result.page(params[:page])
    region = Region.find params[:id]
    region.moderator_id = @moderator.id
    region.save!
    @moderator.region = region
    @moderator.save
    respond_with @regions, location: admin_moderator_regions_path(moderator_id: params[:moderator_id])
  end
end
