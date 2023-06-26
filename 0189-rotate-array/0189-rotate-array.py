class Solution(object):
    def reverse(self, arr, start, end):
        while start<end:
            arr[start], arr[end] = arr[end], arr[start]
            start, end = start+1, end-1
    def rotate(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        #k can be greater than array length
        k = k % n
        self.reverse(nums, 0, n-1)
        self.reverse(nums, 0, k-1)
        self.reverse(nums, k, n-1)
        return nums 