require 'rails_helper'

RSpec.describe ClassRoomsController, type: :controller do
  let(:class_room) { create(:class_room) }

  describe '#index' do
    let(:class_rooms) { create_list(:class_room, 2) }
    
    before { get :index }

    it 'assigns class_rooms' do
      expect(assigns(:class_rooms)).to match_array class_rooms
    end

    context 'with view' do
      render_views

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe '#new' do
    before { get :new }

    it 'assigs a new class_room' do
      expect(assigns(:class_room)).to be_a_new ClassRoom
    end

    context 'with view' do
      render_views

      it 'renders new template' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      subject { post :create, class_room: attributes_for(:class_room) }

      it 'saves a new class_room' do
        expect { subject }.to change(ClassRoom, :count).by(1)
      end

      it 'redirects to class_rooms_path' do
        subject

        expect(response).to redirect_to(class_rooms_path)
      end
    end

    context 'with valid attributes' do
      subject { post :create, class_room: { entry_at: nil, student_id: nil, course_id: nil } }

      it 'saves a new class_room' do
        expect { subject }.to change(ClassRoom, :count).by(0)
      end

      it 'redirects to class_rooms_path' do
        subject

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#edit' do
    before { get :edit, id: class_room.id }

    it 'assigns class_room' do
      expect(assigns(:class_room)).to eq class_room
    end

    context 'with view' do
      render_views

      it 'renders edit' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#update' do
    let!(:time) { Time.now }

    context 'with valid attributes' do
      before { patch :update, id: class_room.id, class_room: { entry_at: time } }

      it 'updates class_room' do
        class_room.reload

        expect(class_room.entry_at.utc).to be_within(1.second).of time
      end

      it 'redirects to class_room_path' do
        expect(response).to redirect_to(class_rooms_path)
      end
    end

    context 'with invalid attributes' do
      before { patch :update, id: class_room.id, class_room: { entry_at: nil } }

      it 'does not updates class_room' do
        class_room.reload

        expect(class_room.student).to eq Student.first
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