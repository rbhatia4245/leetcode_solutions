class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        # use two pointer approach
        n = len(nums)
        idx = n-1
        output = [1]*n
        product = 1
        while idx >= 0:
            product *= nums[idx]
            output[idx] = product
            idx -= 1
        product = 1
        idx = 0
        while idx < n:
            if idx < n-1:
                output[idx] = product * output[idx+1]
                product *= nums[idx]
            else:
                output[idx] = product
            idx += 1
        return output
