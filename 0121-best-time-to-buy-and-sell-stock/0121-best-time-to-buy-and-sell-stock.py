class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        max_profit = 0
        left = 0
        right = left+1
        n = len(prices)
        while left < n-1:
            if right < n and prices[right] > prices[left]:
                profit = prices[right]-prices[left]
                if profit > max_profit:
                    max_profit = profit
                right = right+1
            else:
                left = left+1
                right = left+1
        return max_profit