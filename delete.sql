--delete account data
delete from AdsManagement where m_id in (select m_id from Manager)
delete from Manager where a_id in (select a_id from Account)
delete from CV where c_id in (select c_id from Candidate)
delete from Feedback where c_id in (select c_id from Candidate)
delete from Candidate where a_id in (select a_id from Account)
delete from Employer where a_id in (select a_id from Account)
delete from Company where a_id in (select a_id from Account)
delete from Account

-- delete CV data
delete from CV where c_id in (select c_id from Candidate)

--delete post
delete from PostLog where postD_id in (select postD_id from PostDetail)
delete from PostDetail where e_id in (select e_id from Employer)
delete from Feedback where post_id in (select post_id from Post)
delete from Post where postD_id in (select postD_id from PostDetail)
delete from Post

--delete ads
delete from AdsLog where adsD_id in (select adsD_id from AdsDetail)
delete from Ads where adsD_id in  (select adsD_id from AdsDetail)
delete AdsDetail