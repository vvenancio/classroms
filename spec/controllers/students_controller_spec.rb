require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let!(:student) { create(:student) }

  describe '#index' do
    let(:students) { create_list(:student, 2) }

    before { get :index }

    it 'assigns students' do
      expect(assigns(:students)).to match_array students << student
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

    it 'assigns a new Student' do
      expect(assigns(:student)).to be_a_new Student
    end

    it 'returns student statuses' do
      student_statuses = [['Ativo', 1], ['Inativo', 2]]

      expect(controller.send(:student_statuses)).to match_array student_statuses
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
      subject { post :create, student: attributes_for(:student) }

      it 'creates new student' do
        expect { subject }.to change(Student, :count).by(1)
      end

      it 'redirects to student_path' do
        subject

        expect(response).to redirect_to(students_path)
      end
    end

    context 'with invalid attributes' do
      subject { post :create, student: { name: nil } }

      it 'creates new student' do
        expect { subject }.to change(Student, :count).by(0)
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
    before { get :edit, id: student.id }

    it 'assigns student' do
      expect(assigns(:student)).to eq student
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
      before { patch :update, id: student.id, student: { name: 'Mario' } }

      it 'updates student' do
        student.reload

        expect(student.name).to eq 'Mario'
      end

      it 'redirects to student_path' do
        expect(response).to redirect_to(students_path)
      end
    end

    context 'with invalid attributes' do
      before { patch :update, id: student.id, student: { name: nil } }

      it 'does not updates student' do
        student.reload

        expect(student.name).to eq 'Pedro Alvares'
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