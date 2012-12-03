class FamilyMembersController < ApplicationController
	expose(:neighbor)
	expose(:family_members) {neighbor.family_members}
	expose(:family_member)

def index

end

	def create
		if family_member.save
			redirect_to family_members_path, notice: 'family_member was successfully created.'
		else
			render action: "new"
		end
	end

	def update
		if family_member.save
			redirect_to family_members_path, notice: "Family_member was successfully updated."
		else
			render action: "edit"
		end
	end

	def destroy
		family_member.destroy

		redirect_to family_members_path
	end

	private

	def allowable
		[
			:name, :encrypted_ssn, :age
		]
	end

	def family_member_params
		params.require(:neighbor).permit(*allowable)
	end
end

