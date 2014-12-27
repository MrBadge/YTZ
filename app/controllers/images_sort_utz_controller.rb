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
      ImagesSortUtzPicture.create src: src, images_sort_utz_id: utz.id, ordering: index + 1
    end

    render nothing: true
  end

  def show
    @utz = ImagesSortUtz.find params[:id]
    @pictures = @utz.pictures.order('RANDOM()')
  end

  def check_answer
    pictures = ImagesSortUtzPicture.where(images_sort_utz_id: params[:id]).order(:ordering)

    isAnswerRight = true

    pictures.each_with_index do |pic, index|
      if pic.id != params['answer'][index]
        isAnswerRight = false
        break
      end
    end

    render text: isAnswerRight ? 'Верно' : 'Ошибка'
  end

  def destroy
    ImagesSortUtz.find(params[:id]).destroy
    redirect_to root_path
  end
end
