require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let!(:course) { create(:course) }

  describe '#index' do
    let(:courses) { create_list(:course, 2) }

    before { get :index }

    it 'assigns courses' do
      expect(assigns(:courses)).to match_array courses << course
    end

    context 'with views' do
      render_views

      it 'renders index' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe '#new' do
    before { get :new }

    it 'assigns a new Course' do
      expect(assigns(:course)).to be_a_new Course
    end

    it 'returns course statuses' do
      course_statuses = [['Ativo', 1], ['Inativo', 2]]

      expect(controller.send(:course_statuses)).to match_array course_statuses
    end

    context 'with views' do
      render_views

      it 'renders new' do
        expect(response).to render_template(:new)
      end
    end    
  end

  describe '#create' do
    context 'with valid attributes' do
      subject { post :create, course: attributes_for(:course) }

      it 'creates new course' do
        expect { subject }.to change(Course, :count).by(1)
      end

      it 'redirects to course_path' do
        subject

        expect(response).to redirect_to(courses_path)
      end
    end

    context 'with invalid attributes' do
      subject { post :create, course: { name: nil } }

      it 'creates new course' do
        expect { subject }.to change(Course, :count).by(0)
      end

      context 'with view' do
        render_views

        it 'renders new' do
          subject

          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe '#edit' do
    before { get :edit, id: course.id }

    it 'assigns course' do
      expect(assigns(:course)).to eq course
    end

    context 'with view' do
      render_views

      it 'renders edit' do
        expect(response).to render_template(:edit)
      end
    end
  end
 
  describe '#update' do
    context 'with valid attributes' do
      before { patch :update, id: course.id, course: { name: 'Matemática' } }

      it 'updates course' do
        course.reload

        expect(course.name).to eq 'Matemática'
      end

      it 'redirects to course_path' do
        expect(response).to redirect_to(courses_path)
      end
    end

    context 'with invalid attributes' do
      before { patch :update, id: course.id, course: { name: nil } }

      it 'does not updates course' do
        course.reload

        expect(course.name).to eq 'Biologia'
      end

      context 'with view' do
        render_views

        it 'renders edit' do
          expect(response).to render_template(:edit)
        end
      end
    end
  end
end