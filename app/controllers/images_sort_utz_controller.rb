class ImagesSortUtzController < ApplicationController
  def new
  end

  def create
    level_dict = {'Легкий' => 1, 'Средний' => 2, 'Сложный' => 3}

    utz = ImagesSortUtz.create goal: params['goal'],
                               theme: params['theme'],
                               hint: params['hint'],
                               level: level_dict[params['level']]

    params['images'].each_with_index do |src, index|
      ImagesSortUtzPicture.create src: img, images_sort_utz_id: utz.id, ordering: index + 1
    end

    render nothing: true
  end

  def show
    @utz = ImagesSortUtz.find params[:id]
  end

  def destroy
    ImagesSortUtz.find(params[:id]).destroy
    redirect_to root_path
  end
end
