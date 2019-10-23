module Rewards
  class PointsCalculations

    def self.perform(referral_id)
      base = 1
      chain_points(referral_id).map do |selection|
        ReferralChain.find_by(user_id: selection['user_id']).update(points: selection['points'] + base)
        base = base * 0.5
      end
    end

    def self.chain_points(referral_id)
      tree_query =
          <<-SQL.squish
              WITH RECURSIVE referral_tree AS (
              SELECT * FROM referral_chains WHERE user_id = #{referral_id}
              UNION ALL
              SELECT
              referral_chains.*
              FROM referral_chains 
              JOIN referral_tree ON referral_tree.referral_id = referral_chains.user_id
              )
              SELECT DISTINCT user_id, points FROM referral_tree 
              ORDER BY user_id DESC;
      SQL
      ActiveRecord::Base.connection.execute(tree_query).to_a
    end


      # def query_function
      #   ActiveRecord::Base.connection.execute(
      #       <<-SQL.squish
      # CREATE OR REPLACE FUNCTION parents_points()
      # RETURNS TABLE(points double precision) AS $$
      # BEGIN
      #   return query
      #   WITH RECURSIVE referral_tree AS (
      #   SELECT * FROM referral_chains WHERE referral_chains.user_id = 12
      #   UNION ALL
      #   SELECT
      #   referral_chains.*
      #   FROM referral_chains
      #   JOIN referral_tree ON referral_tree.referral_id = referral_chains.user_id
      #   )
      #   SELECT referral_tree.points FROM referral_tree ORDER BY user_id DESC;
      #   END;
      #   $$ LANGUAGE plpgsql STRICT;
      #    SELECT parents_points()
      #   SQL
      #   ).to_a
      #
      # end
  end
end