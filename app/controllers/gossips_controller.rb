class GossipsController < ApplicationController
	def index
		@gossips = Gossip.all
	end

	def new
		@gossip = Gossip.new
	end

	def create
		@gossip = current_moussaillon.gossips.build(gossip_params)
		if @gossip.save
  		   redirect_to @gossip
  		else
    	   render 'new'
  		end
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def edit
		 @gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
 
  		if @gossip.update(gossip_params)
    	   redirect_to @gossip
  		else
    	   render 'edit'
  		end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
  		@gossip.destroy
 
  		redirect_to gossips_path
	end

	private
   		 # Use callbacks to share common setup or constraints between actions.
    	 def set_gossip
     	 @gossip = Gossip.find(params[:id])
    	 end

   		# Never trust parameters from the scary internet, only allow the white list through.
    	def gossip_params
      	params.require(:gossip).permit(:title, :content, :anonymous_username, :user_id)
   		end

   	end
