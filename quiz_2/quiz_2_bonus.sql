SELECT department, COUNT(*) as number_of_support_requests FROM requests
GROUP BY department ORDER BY number_of_support_requests
